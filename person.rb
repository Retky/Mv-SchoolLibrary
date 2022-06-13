class Person
  attr_reader :id # getter
  attr_accessor :name, :age # getter & setter

  def initialize(age, name = 'Unknown', parent_permission: true)
    @parent_permission = parent_permission
    @id = Random.rand(1..1000)
    @name = name
    @age = age
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  private

  def of_age?
    @age >= 18
  end
end
