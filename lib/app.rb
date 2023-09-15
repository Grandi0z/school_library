require_relative 'classroom'
require_relative 'student'
require_relative 'teacher'
require_relative 'trimmer_decorator'
require_relative 'capitalize_decorator'
require_relative 'book'
require_relative 'rental'

class App
  
  def create_book(books)
    book_command = ["Title", "Author"]
    book_elment = get_chomp(book_command)
    books.push(Book.new(book_elment["Title"], book_elment["Author"]))
  end

  def get_chomp(arr)
    received = {}
    arr.each { |elt| 
      puts "#{elt} :"
      value = gets.chomp
      received[elt] = value
    }
    received # return the hash
  end

  def list_books
    books.map { |book| "Title: #{book.title}, Author: #{book.author}" }
  end

  def list_commands(arr)
    arr.map.with_index { |command, index| puts "#{index + 1} - #{command}" }
  end

  def make_cases(arr)
    lenght = arr.lenght
  end
  
  def main_menu(books)
    main_command = [
      'List all books', 'List all people',
      'Create a person', 'Create a book', 'Create a rental',
      'List all rentals for a given person id', 'Exit'
    ]
    puts 'Welcomme to school library app'
    puts 'Please choose an option by enrerin a number'
    self.list_commands(main_command)
    choice = gets.chomp
    case choice.to_s
      when '1'
        puts choice
      when '2'
        puts choice
      when '3'
        puts choice
      when '4'
        self.create_book(books)
      when '5'
        puts choice
      when '6'
        puts choice
      when '7'
        puts choice
      else
        puts 'Wrong key'
      end
  end
end

def main
  app = App.new 
  @books = []
  @people = []
  @rental = []
  app.main_menu(@books)
end

main
