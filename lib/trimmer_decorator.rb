require_relative 'edit_name'

class TrimmerDecorator < EditName
  def trimmer(name)
    if name.length > 10
      name.slice(0, 10)
    else
      name
    end
  end

  def correct_name
    trimmer(@nameable.correct_name)
  end
  private :trimmer
end
