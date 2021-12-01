def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    students = []
    name = gets.chomp
    while !name.empty? do
        students << {name: name, cohort: :november}
        puts "Now we have #{students.count} students"
        name = gets.chomp
    end
    students
end
students = input_students
#and then print them
def print_header
    puts "The students of Villiains Academy"
    puts "--------------"
end
def print(students)
    students.each_with_index do |student, index|
        special_student = student[:name].split("")
        if special_student[0] == "m"
            puts "#{index + 1}. #{student[:name]} (#{student[:cohort]}) cohort"
        end
    end
end
#finally we print the total number of students
def print_footer(names)
    puts "Overall, we have #{names.count} great students"
end

print_header
print(students)
print_footer(students)