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
class2 = Classroom.new('B1')

malick = Student.new(19, class1, 'malick')
jacques = Student.new(17, class1, 'jacques', parent_permission: false)
amy = Student.new(17, class1, 'amy', parent_permission: true)
james = Teacher.new(34, 'Theories', 'james')

puts(class1.students.map(&:name))
puts(class2.students.map(&:name))
class2.add_student(amy)
puts(class1.students.map(&:name))
puts(class2.students.map(&:name))
jacques.classroom = class2
puts jacques.classroom.label
puts(class1.students.map(&:name))
puts(class2.students.map(&:name))

book1 = Book.new('The great congo', 'Malumbu')
book2 = Book.new('A short talk', 'Moses')
book3 = Book.new('Java', 'Island')

Rental.new('2017-11-11', amy, book1)
Rental.new('2017-10-10', amy, book2)
Rental.new('2017-10-10', jacques, book1)
Rental.new('2017-10-10', malick, book1)
Rental.new('2017-11-9', malick, book2)
puts(amy.rentals.map { |rental| rental.book.title })
puts(book2.rentals.map { |rental| rental.person.name })
malick.add_rental(book3, '2017-11-9')
puts(book3.rentals.map { |rental| rental.person.name })
puts(malick.rentals.map { |rental| rental.book.title })
puts(book1.rentals.map { |rental| rental.person.name })
rent = Rental.new('2017-11-9', james, book2)
book1.add_rental(rent)
puts(book1.rentals.map { |rental| rental.person.name })
puts(james.rentals.map { |rental| rental.book.title })
