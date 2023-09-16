class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(rental)
    Rental.new(rental.date, rental.person, self) # add a book to a rental
  end
end
