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

  def list_books
    @books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
    puts ''
  end

  def list_persons
    @persons.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
    puts ''
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
      puts "Person created successfully \n\n"
    when '2'
      print 'Specialization: '
      specialization = gets.chomp
      @persons << Teacher.new(age, specialization, name)
      puts "Person created successfully \n\n"
    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @books << Book.new(title, author)
    puts "Book created successfully \n"
  end

  def create_rental
    puts 'Select a Book from the following list by number'
    @books.each_with_index { |book, index| puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}" }
    book_index = gets.chomp.to_i
    puts 'Select a Person from the following list by number (not id)'
    @persons.each_with_index { |person, index| puts " #{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" } # rubocop:disable Layout/LineLength
    person_index = gets.chomp.to_i
    print 'Date: '
    date = gets.chomp
    @rentals << Rental.new(date, @persons[person_index], @books[book_index])
    puts "Rental created successfully \n\n"
  end

  def list_rentals
    print 'ID of person: '
    person_id = gets.chomp.to_i
    puts 'Rentals: '
    @rentals.each { |rent| puts "#{rent.class} #{rent.date} | Book: \"#{rent.book.title}\" rented by #{rent.person.name}" if rent.person.id == person_id } # rubocop:disable Layout/LineLength
    puts ''
  end
end
