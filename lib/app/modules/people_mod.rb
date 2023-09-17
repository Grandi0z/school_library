module People
  def find_class_room(label)
    # return the existing classroom
    return @classrooms.find { |c| c.label == label } if @classrooms.any? { |c| c.label == label }

    # if not, create it
    classroom = Classroom.new(label)
    @classrooms.push(classroom)
    classroom
  end

  def select_a_person
    puts 'Select a person from this list'
    @people.map.with_index do |person, index|
      print "#{index + 1} - [#{person.class}] Name: '#{person.name}', ID: '#{person.id}', Age: '#{person.age}' \n"
    end
    choice = gets.chomp
    # the index in the ui list - 1, return the book if not nil
    @people[(choice.to_i - 1)] || nil
  end

  def people_menu
    print 'Do you want to create a student (1) or a teacher (2) ? [Input the number] :'
    choice = gets.chomp
    case choice.to_s
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Chose 1 or 2'
      people_menu
    end
  end
end
