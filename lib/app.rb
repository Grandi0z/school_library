require_relative 'classroom'
require_relative 'student'
require_relative 'teacher'
require_relative 'trimmer_decorator'
require_relative 'capitalize_decorator'
require_relative 'book'
require_relative 'rental'

Person.new(4, 'Rex', parent_permission: false)

person = Person.new(22, 'maximilianus')
puts person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name

class1 = Classroom.new('A1')
Classroom.new('B1')
malick = Student.new(19, class1, 'malick')
jacques = Student.new(17, class1, 'jacques', parent_permission: false)
amy = Student.new(17, class1, 'amy', parent_permission: true)

book1 = Book.new('The great congo', 'Malumbu')
book2 = Book.new('A short talk', 'Moses')

Rental.new('2017-11-11', amy, book1)
Rental.new('2017-10-10', amy, book2)
Rental.new('2017-10-10', jacques, book1)
Rental.new('2017-10-10', malick, book1)
Rental.new('2017-11-9', malick, book2)
puts(amy.rentals.map { |rental| rental.book.title })
puts(book2.rentals.map { |rental| rental.person.name })
