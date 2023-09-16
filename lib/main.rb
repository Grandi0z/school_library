require_relative 'app/app'
# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/MethodLength
def main
  app = App.new
  response = nil # *Present the user with a list of options to perform.
  puts "Welcome to School Library App!\n\n"
  while response != '7'
    puts 'Please choose an option by enterin a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit' # *Lets users choose an option.
    response = gets.chomp
    case response
    when '1'
      app.list_books
    when '2'
      app.list_people
    when '3'
      app.people_menu
    when '4'
      app.create_book
    when '5'
      app.create_rendal
    when '6'
      app.list_my_rentals
    when '7'
      abort('Thank you for using this app.')
    end
  end
end
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/CyclomaticComplexity
main
