module RentalMod
  def create_rendal
    book = nil
    person = nil
    # avoid to go to next step unless we get a correct answer
    person = select_a_person while person.nil?
    book = select_a_book while book.nil?
    print 'Add a date :'
    date = gets.chomp
    @rentals.push(Rental.new(date, person, book))
    main_menu
  end

  def list_my_rentals
    print 'ID of person : '
    id = gets.chomp.to_i
    my_rentals = []
    @rentals.each do |rental|
      my_rentals.push(rental) unless rental.person.id != id
    end
    puts 'List of renals'
    my_rentals.map do |rental|
      puts "#{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
    end
    main_menu
  end
end
