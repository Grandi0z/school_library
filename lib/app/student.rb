require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(age, classroom = nil, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
    @classroom.add_student(self)
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom.students.delete(self) # remove the student from the previous classroom
    @classroom = classroom
    @classroom.add_student(self) # add in the classroom
  end
end
