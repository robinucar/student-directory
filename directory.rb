@students = []
def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Group the students by cohort"
    puts "4. Save the list to students.csv"
    puts "5. Load the list of students from students.csv"
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
            group_by_cohort
        when "4"
            save_students
        when "5"
            load_students
        when "9"
            exit
        else
            puts "I don't know what you mean, try again"
        end
end
def interactive_menu
   loop do
        print_menu
        process(STDIN.gets.chomp)
   end
end
def input_students
    puts "Please enter the full name of the student:"
    name = STDIN.gets.chomp.to_sym
    while !name.empty? do
        puts "Please type the student joined cohort:"
        cohort = gets.chomp.to_sym
        if cohort == ''.to_sym
            cohort = 'november'.to_sym
        else
            cohort = cohort
        end
        puts "Please enter the student age as a number:"
        age = gets.chomp.to_i
        puts "Please enter the gender of student:"
        gender = gets.chomp.to_s
        puts "Please enter the nationality of student:"
        nationality = gets.chomp.to_s
        @students << {name: name, age: age, gender: gender, nationality: nationality, cohort: cohort}
        if @students.count == 1
            puts "Now we have #{@students.count} student."
        else
            puts "Now we have #{@students.count} students."
        end
        puts "Please enter the name of another student. To finish just hit the return!"
        name = STDIN.gets.chomp
    end
    @students
end

#and then print them
def print_header
    puts "The students of Villiains Academy"
    puts "--------------"
end
def print_students_list
    index = 0
    while index < @students.length
        current_name = @students[index]
        puts "#{index + 1} Full name: #{current_name[:name].to_s.split(/ |\_|\-/).map(&:capitalize).join(" ").to_sym}, 
            Age: #{current_name[:age]}, 
            Gender: #{current_name[:gender].capitalize()}, 
            Nationality: #{current_name[:nationality].capitalize()}, 
            Cohort: #{current_name[:cohort].capitalize()} "
        index += 1
    end
end




#finally we print the total number of students
def print_footer
    if @students.count == 0
        puts "We do not have any students yet"
    elsif @students.count == 1
        puts "Overall, we have #{@students.count} great student.".center(45)
    else
        puts "Overall, we have #{@students.count} great students.".center(45)
    end
end
def save_students
    #open the file for writing
    file = File.open("students.csv", "w")
    #iterate over the array of students
    @students.each do |student|
        student_data = [student[:name], student[:age], student[:gender], student[:nationality], student[:cohort]]
        csv_line = student_data.join(', ')
        file.puts csv_line
    end
    file.close
end
#load the students
def load_students(filename = "students.csv")
    file = File.open("students.csv", "r")
    file.readlines.each do |line|
        name, cohort, age, gender, nationality = line.chomp.split(',')
        @students << {name: name.to_sym, age: age.to_sym, gender: gender.to_sym, nationality: nationality.to_sym, cohort: cohort.to_sym}
    end
    file.close
end

#try loading students
def try_load_students
    filename = ARGV.first# first argument from the command line
    return if filename.nil? # get out of the method if it isn't given
    if File.exists?(filename) # if it exists
      load_students(filename)
       puts "Loaded #{@students.count} from #{filename}"
    else # if it doesn't exist
      puts "Sorry, #{filename} doesn't exist."
      exit # quit the program
    end
  end
#grouping students by chort
def group_by_cohort
    if @students.length > 0
        puts "Please type the cohort you want to see."
        month = STDIN.gets.chomp.capitalize().to_sym
        group = @students.select { |student| student[:cohort].capitalize() == month }
        if group.length > 0
                group.each do |key, value|
                puts "#{key}: #{value}"
            end
        else
            puts "There is not any student in #{month.capitalize()} cohort."
        end
    end
end
try_load_students
interactive_menu
