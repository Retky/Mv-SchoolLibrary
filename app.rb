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

  def menu
    puts [
      'Please choose an option by enterin a number:',
      '1 - List all books',
      '2 - List all people',
      '3 - Create a person',
      '4 - Create a book',
      '5 - Create a rental',
      '6 - List all rentals for a given person id',
      '7 - Exit'
    ]
    select(gets.chomp)
  end

  def select(input)
    case input
    when '1' then list_books
    when '2' then list_persons
    when '3' then create_person
    when '4' then create_book
    when '5' then create_rental
    when '6' then list_rentals
    end
  end

  def list_books
    @persons.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
    menu
  end

  def list_persons
    @persons.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
    menu
  end

  def create_person
    print 'Do you want to create a Student (1) or a Teacher (2)? [Input the number]: '
    person_type = gets.chomp
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    case person_type
    when '1'
      print 'Has parent permission? [Y/N]: '
      permission = gets[0] == 'Y'
      @persons << Student.new(age, 'unassigned', name, parent_permission: permission)
      puts ['Person created successfully', '']
      menu
    when '2'
      print 'Specialization: '
      specialization = gets.chomp
      @persons << Teacher.new(age, specialization, name)
      puts ['Person created successfully', '']
      menu
    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @books << Book.new(title, author)
  end

  def create_rental
    print 'rental'
  end

  def list_rentals
    print 'rentals'
  end
end
