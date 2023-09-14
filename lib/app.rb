require_relative 'student'
require_relative 'teacher'
require_relative 'trimmer_decorator'
require_relative 'capitalize_decorator'

Person.new(4, 'Rex', parent_permission: false)
Student.new(18, 'A1', 'Malick')
Teacher.new(85, 'Math', 'Henry')

person = Person.new(22, 'maximilianus')
person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name
