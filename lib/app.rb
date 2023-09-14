require_relative 'person'
require_relative 'student'
require_relative 'teacher'

Person.new(4, 'Rex', parent_permission: false)
Student.new(18, 'A1', 'Malick')
Teacher.new(85, 'Math', 'Henry')
