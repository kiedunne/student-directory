
@students = []

def input_students
  while true do
    puts "Please enter the names of a student"
    puts "To finish, just type stop"
    name = gets.chomp
    break if name == "stop"

    puts "Please enter the cohort of the student"
    puts "To finish, just type stop"
    cohort = gets.chomp
    break if cohort == "stop"

    puts "Please enter the nationality of the student"
    puts "To finish, just type stop"
    nationality = gets.chomp
    break if nationality == "stop"

    @students << {name: name, cohort: cohort, nationality: nationality}
    puts "Now we have #{@students.count} students. Name of next student?"

  end
  @students
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
  end
end

def print_header
  puts "The Students of Villains Academy".center(100)
  puts "--------------------------".center(100)
end

def print_students_list
  @students.each_with_index do |student, index|
    puts "#{index}. #{student[:name]} (Cohort: #{student[:cohort]} ) (Nationality: #{student[:nationality]} )".center(100)
  end
end
#
def print_footer
  if @students.count == 1
    puts "Overall, we have #{@students.count} great student.".center(100)
  else
  puts "Overall, we have #{@students.count} great students.".center(100)
  end
end
 
def save_students
  file = File.open('students.csv', 'w')
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:nationality]]
    csv_line = student_data.join(',')
    file.puts csv_line
  end
  file.close
  puts "students.csv created!"
end

interactive_menu
