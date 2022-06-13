require_relative './person'

class Teacher < Person
  def initialize(age, name = 'Unknown')
    super(age, name)
  end
end
