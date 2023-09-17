require_relative 'app/app'

def list_commands
  option_commande = [
    'List all books', 'List all people',
    'Create a person', 'Create a book', 'Create a rental',
    'List all rentals for a given person id', 'Exit'
  ]
  option_commande.map.with_index { |command, index| puts "#{index + 1} - #{command}" }
end

def menu(response, app)
  menu_options = {
    '1' => 'list_books',
    '2' => 'list_people',
    '3' => 'people_menu',
    '4' => 'create_book',
    '5' => 'create_rendal',
    '6' => 'list_my_rentals'
  }

  while response != '7'
    puts 'Please choose an option by entering a number:'
    list_commands

    response = gets.chomp

    if menu_options.key?(response)
      app.send(menu_options[response])
    else
      puts 'Invalid option.'
    end
  end

  puts 'Thank you for using this app.'
end

def main
  app = App.new
  response = nil # *Present the user with a list of options to perform.
  puts "Welcome to School Library App!\n\n"
  menu(response, app)
end
main
