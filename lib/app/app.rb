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

  def list_books
    puts 'Liste of books : '
    @books.map { |book| puts "Title: '#{book.title}', Author: '#{book.author}'" }
  end

  def create_book
    book_args = %w[Title Author]
    book_elment = get_chomp(book_args) # generate question for the user
    @books.push(Book.new(book_elment['Title'], book_elment['Author']))
    puts 'Book created'
  end

  def create_student
    student_args = ['Age', 'Name', 'Parent permission']
    student_elements = get_chomp(student_args) # get data from user
    # find a class by it's label if not create a new one
    classroom = find_class_room('A1')
    @people.push(
      Student.new(
        student_elements['Age'], classroom,
        student_elements['Name'], parent_permission: ['Parent permission']
      )
    )
    puts 'Student created'
  end

  def create_teacher
    teacher_args = %w[Age Specialization Name]
    teacher_elements = get_chomp(teacher_args)
    @people.push(
      Teacher.new(
        teacher_elements['Age'], teacher_elements['Specialization'],
        teacher_elements['Name']
      )
    )
    puts 'Teacher created'
  end

  def list_people
    puts 'Liste of people : '
    @people.map do |person|
      puts "[#{person.class}] Name: '#{person.name}', ID: '#{person.id}', Age: '#{person.age}' "
    end
  end

  def create_rendal
    book = nil
    person = nil
    # avoid to go to next step unless we get a correct answer
    person = select_a_person while person.nil?
    book = select_a_book while book.nil?
    print 'Add a date :'
    date = gets.chomp
    @rentals.push(Rental.new(date, person, book))
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
  end
end
