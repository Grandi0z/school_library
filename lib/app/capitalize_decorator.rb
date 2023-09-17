require_relative 'edit_name'

class CapitalizeDecorator < EditName
  def correct_name
    @nameable.correct_name.capitalize
  end
end
