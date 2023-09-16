require_relative 'classroom'
require_relative 'student'
require_relative 'teacher'
require_relative 'trimmer_decorator'
require_relative 'capitalize_decorator'
require_relative 'book'
require_relative 'rental'
require_relative 'modules/people_mod'
require_relative 'modules/book_mod'
require_relative 'modules/rental_mod'

class App
  include People
  include BookMod
  include RentalMod
  def initialize
    @books = []
    @people = []
    @rentals = []
    @classrooms = []
  end

  # retrieve the data from the user
  def get_chomp(arr)
    received = {}
    arr.each do |elt|
      print "#{elt} :"
      value = gets.chomp
      received[elt] = value
    end
    received # return the hash
  end

  # display the main menu commande
  def list_commands(arr)
    arr.map.with_index { |command, index| puts "#{index + 1} - #{command}" }
  end

  def main_header
    main_command = [
      'List all books', 'List all people',
      'Create a person', 'Create a book', 'Create a rental',
      'List all rentals for a given person id', 'Exit'
    ]
    puts "\n Welcomme to school library app"
    puts " Please choose an option by enrerin a number \n"
    list_commands(main_command)
  end

  def execute_option(choice)
    menu_options = {
      '1' => :list_books,
      '2' => :list_people,
      '3' => :people_menu,
      '4' => :create_book,
      '5' => :create_rendal,
      '6' => :list_my_rentals,
      '7' => :exit_app
    }
    if menu_options[choice]
      send(menu_options[choice]) # send invokes another method by its name
    else
      puts 'WRONG KEY'
      main_menu
    end
  end

  def exit_app
    abort('Thank you for using this app.')
  end

  def main_menu
    main_header
    choice = gets.chomp
    execute_option(choice)
  end
end
