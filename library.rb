# Public: A Class containing information that a book Library
# would want to keep track of.
class Library

  # Public: Initializes a Library with an empty Array of books and empty Hash 
  #         for checked out books
  # 
  # Called automatically when a new Library Object is created.
  def initialize
    @books = []
  end


  # Public: puts a list of books and their checkout status to the console
  #
  # Examples
  #
  #     list_books
  #     # => '"Jonathan Livingston Seagull" : available '
  #     # => '"2001: A Space Odyssey" : checked out'
  #
  # Returns nothing 
  def list_books
    @books.each do |book|
      if book.checked_out
        puts '"' + book.title + '" : checked out'
      else
        puts '"' + book.title + '" : avaiable'
      end
    end 
  end


  # Public: puts a list of the borrowed books and their borrowers to the console
  # Examples
  #
  #     borrowed_books
  #     # => The following books have been checked out:
  #     # =>    "Jonathan Livingston Seagull" has been checked out by Jill.
  #     # =>    "2001: A Space Odyssey" has been checked out by Gene.
  #
  # Returns nothing
  def borrowed_books
    puts "The following books have been checked out:"
    @books.each do |book|
      if book.checked_out
        puts "    \"#{book.title}\" has been checked out by #{book.current_patron.name}."
      end
    end
  end


  # Public: puts a list of the books available for checkout to the console
  # Examples
  #
  #     borrowed_books
  #     # => The following books are available for check out:
  #     # =>    "Jonathan Livingston Seagull"
  #     # =>    "2001: A Space Odyssey"
  #
  # Returns nothing
  def available_books
    puts "The following books are available for check out:"
    @books.each do |book|
      if book.checked_out == false
        puts "    \"#{book.title}\""
      end
    end
  end


  # Public: Adds an Object to the @books array
  #
  # book - The Object you want to be added to the array
  #
  # Examples
  #
  #     add_book(seagull)
  #     # => @books = [seagull]
  # 
  # Returns nothing
  def add_book(book)
    @books << book
  end


  # Public: checks out a Book to a Borrower. 
  #
  # user - The Borrower who will check out the book
  # book - The Book to be checked out
  #
  # Examples
  #
  #     check_out(bruce, seagull)
  #     # => seagull.checked_out = true
  #     # => seagull.current_patron = bruce
  #     # => bruce.books = [seagull]
  #     # => "Library patron Bruce has checked out "Jonathan Livingston Seagull"
  #
  # Returns nothing
  def check_out(user, book)
    if user.books.length == 2
      puts "This library patron already has two books checked out!"
      return
    end
    if book.checked_out == false
      book.checked_out = true
      book.current_patron = user
      user.books << book
      puts "Library patron #{user.name} has checked out \"#{book.title}.\""
    else
      puts "Sorry, this books has already been checked out."
    end
  end

  
  # Public: checks a Book back into the Library.
  #
  # book - The Book to be checked in
  #
  # Examples
  #
  #     check_in(seagull)
  #     # => "Library patron Bruce has returned "Jonathan Livingston Seagull""
  #     # => bruce.books = []
  #     # => seagull.current_patron = nil
  #     # => seagull.checked_out = false
  #
  # Returns nothing
  def check_in(book)
    if book.checked_out
      puts "Library patron #{book.current_patron.name} has returned \"#{book.title}\"."
      book.current_patron.books.delete(book)
      book.current_patron = nil
      book.checked_out = false
    else
      puts "This book is already checked in!"
    end
  end

end




# Public: The Borrower Class describes a user of the Library system.
class Borrower

  # Public: Gets/Sets the Borrowers Array list of Books currently held.
  attr_accessor :books

  # Public: Gets/Sets the Borrowers's String name.  
  attr_accessor :name

  # Public: Creates a Borrower Object with a name and Array of books checked out.
  #
  # name - The String that will become the name of the Borrower.
  #
  # Returns nothing
  def initialize(name)
    @name = name
    @books = []
  end


  # Public: Puts to the console the title of each book that the Borrower currently
  #         has checked out.
  #
  # Examples
  #
  #     borrowed_books_list
  #     # => "Jill has checked out:
  #     # =>      "Jonathan Livingston Seagull""
  # Returns nothing
  def borrowed_books_list
    puts "#{@name} has checked out:"
    @books.each do |book|
      puts "    \"#{book.title}\""
    end
  end

end





# Public: The Book Class descibes a book with basic attributes.
class Book

  # Public: Gets/Sets the Book's Boolean checked_out status.
  attr_accessor :checked_out

  # Public: Gets/Sets the Book's String title.
  attr_accessor :title

  # Public: Gets/Sets the Book's associated Borrower Object.
  attr_accessor :current_patron

  # Public: Gets/Sets the Book's String for year published.
  attr_accessor :year_published

  # Public: Gets/Sets the Book's String edition.
  attr_accessor :edition

  # Public: Gets/Sets the Book's Hash of review Arrays.
  attr_accessor :reviews

  # Public: Initialize a Book that is not checked out.
  #
  # title - The String that will name the title of the Book
  # author - The String that will name the author of the Book
  def initialize(title, author,year="unknown", edition="unknown")
    @title = title
    @author = author
    @checked_out = false
    @current_patron = nil
    @year_published = year
    @edition = edition
    @reviews = {}
  end

  # Public: Adds to the @reviews Hash the Borrower as Key, and the
  #         rating and review as Array values in the Hash Value Array
  #
  # user - the Borrower Object who is leaving the review
  # rating - the String rating given to the book
  # review - and optional String reveiw of the book
  #
  # Examples
  #
  #     add_review(jill, "5", "Great book!")
  #     # => @reviews = {:jill => ["5", "Great book!"]}
  def add_review(user, rating, review="no review")
    @reviews[user.name] = [rating, review]
  end


end
