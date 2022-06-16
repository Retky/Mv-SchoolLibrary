require_relative './app'

def main
  new_app = App.new

  puts "Welcome to School Library App! \n\n"
  loop do
    menu
    input = checker
    case input
    when 1 then new_app.list_books
    when 2 then new_app.list_persons
    when 3 then new_app.create_person
    when 4 then new_app.create_book
    when 5 then new_app.create_rental
    when 6 then new_app.list_rentals
    else break
    end
  end
  puts "Thank you for using this app! \n\n"
end

def menu
  puts [
    'Please choose an option by entering a number:',
    '1 - List all books',
    '2 - List all people',
    '3 - Create a person',
    '4 - Create a book',
    '5 - Create a rental',
    '6 - List all rentals for a given person id',
    '7 - Exit'
  ]
end

def checker
  input = gets.chomp.to_i
  while input > 7 || input < 1
    puts 'Select a valid option by entering a number:'
    input = gets.chomp
  end
  input
end

main
