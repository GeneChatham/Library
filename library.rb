# Public: A Class containing information that a book Library
# would want to keep track of.
class Library

  # Public: Initializes a Library with an empty Array of books
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
  end

  def available_books
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

  def check_out(user, book)
  end

  def check_in(book)
  end
end

# Public: The Borrower Class describes a user of the Library system
class Borrower

  # Public: Creates a Borrower Object with a @name instance variable
  #
  # name - The String that will become the name of the Borrower
  def initialize(name)
    @name = name
  end

  def borrowed_books
  end

  def name
  end

  def borrowed_books_count
  end

  def borrowed_books_list
  end
end

# Public: The Book Class descibes a book with basic attributes
class Book

  # Public: Initialize a Book that is not checked out.
  #
  # title - The String that will name the title of the Book
  # author - The String that will name the author of the Book
  def initialize(title, author)
    @title = title
    @author = author
    @checked_out = false
  end

  # Public: Returns the book title.
  #
  # Examples
  #
  #     2001.title
  #     # => "2001: A Space Odyssey"
  #
  # Returns @title
  def title
    @title
  end

  # Public: Returns a Boolean indicating if the Book is checked out or not.
  #
  # Examples
  #
  #     2001.checked_out
  #     # => true
  #
  # Returns @title
  def checked_out
    @checked_out
  end

end
