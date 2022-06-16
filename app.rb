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

  def selection(input)
    case input
    when 1 then list_books
    when 2 then list_persons
    when 3 then create_person
    when 4 then create_book
    when 5 then create_rental
    when 6 then list_rentals
    when 7 then exit
    end
  end

  def menu
    puts [
      '1 - List all books',
      '2 - List all people',
      '3 - Create a person',
      '4 - Create a book',
      '5 - Create a rental',
      '6 - List all rentals for a given person id',
      '7 - Exit'
    ]
    puts selection(gets.chomp)
  end
end
