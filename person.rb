require_relative './nameable'
require_relative './rental'

class Person < Nameable
  attr_reader :id, :rentals # getter
  attr_accessor :name, :age # getter & setter

  def initialize(age, name = 'Unknown', parent_permission = true) # rubocop:disable Style/OptionalBooleanParameter
    super()
    @parent_permission = parent_permission
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(date, book)
    @rentals << Rental.new(date, self, book)
  end

  private

  def of_age?
    @age >= 18
  end
end
