require_relative './person'
require_relative './student'
require_relative './teacher'
require_relative './classroom'
require_relative './book'
require_relative './rental'

class App
  def initialize
    @persons = []
    @books = []
    @rentals = []
  end

end
