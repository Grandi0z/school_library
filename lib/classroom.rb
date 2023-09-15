class Classroom
  attr_accessor :label
  attr_reader :students

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    @students.push(student) unless @students.include? student
    return unless student.classroom != self

    student.classroom.students.delete(student)
    student.classroom = self
  end
end
