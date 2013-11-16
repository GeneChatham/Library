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

  def books
  end

  # Public: puts a list of books and their checkout status to the console
  #
  # Examples
  #
  #     listbooks
  #     # => '"Jonathan Livingston Seagull" : available '
  #     # => '"2001: A Space Odyysey" : checked out'
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

  def borrowed_books
    puts "The following books have been checked out:"
    @books.each do |book|
      if book.checked_out
        puts "    \"#{book.title}\" has been checked out by #{book.current_patron.name}."
      end
    end
  end

  def available_books
    puts "The following books are available for check out:"
    @books.each do |book|
      if book.checked_out == false
        puts "    \"#{book.title}\""
      end
    end
  end

  # Public: Adds an object to the @books array
  #
  # book - The Object you want to be added to the array
  #
  # Examples
  #
  #     add_book(seagull)
  #     # => @book = [seagull]
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
  #     # => @books_out = {seagull: bruce}
  #     # => seagull.checked_out = true
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




# Public: The Borrower Class describes a user of the Library system
class Borrower

  attr_accessor :books

  # Public: Creates a Borrower Object with a name and Array of books checked out.
  #
  # name - The String that will become the name of the Borrower
  def initialize(name)
    @name = name
    @books = []
  end

  def borrowed_books
    @books
  end

  def name
    @name
  end

  def borrowed_books_count
  end

  def borrowed_books_list
    puts "#{@name} has checked out:"
    @books.each do |book|
      puts "    \"#{book.title}\""
    end
  end
end





# Public: The Book Class descibes a book with basic attributes
class Book

  attr_accessor :checked_out
  attr_accessor :title
  attr_accessor :current_patron

  # Public: Initialize a Book that is not checked out.
  #
  # title - The String that will name the title of the Book
  # author - The String that will name the author of the Book
  def initialize(title, author)
    @title = title
    @author = author
    @checked_out = false
    @current_patron = nil
  end

  # # Public: Returns the book title.
  # #
  # # Examples
  # #
  # #     2001.title
  # #     # => "2001: A Space Odyssey"
  # #
  # # Returns @title
  # def title
  #   @title
  # end

end
