module BookMod
  def create_book
    book_args = %w[Title Author]
    book_elment = get_chomp(book_args) # generate question for the user
    @books.push(Book.new(book_elment['Title'], book_elment['Author']))
    puts 'Book created'
    main_menu
  end

  def select_a_book
    puts 'Select a book from this list'
    @books.map.with_index do |book, index|
      print "#{index + 1} - Title: '#{book.title}', Author: '#{book.author}' \n"
    end
    choice2 = gets.chomp
    @books[(choice2.to_i - 1)] || nil
  end
end
