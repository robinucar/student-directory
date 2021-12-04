
def input_students
    puts "Please enter the first name and cohort of the student:"
    name, cohort = gets.split.map(&:to_sym)
    if cohort == nil
        cohort = 'november'.to_sym
    end

    students = []
    while !name.empty? do
        puts "Please enter the student age as a number:"
        age = gets.chomp.to_i
        puts "Please enter the gender of student:"
        gender = gets.chomp.to_s
        puts "Please enter the nationality of student:"
        nationality = gets.chomp.to_s
        students << {name: name, age: age, gender: gender, nationality: nationality, cohort: cohort}
        puts "Now we have #{students.count} students"
        puts "Please enter the name of another student. To finish just hit the return!"
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
def print(names)
    index = 0
    while index < names.length 
        current_name = names[index]
        puts "#{index + 1} First name: #{current_name[:name].capitalize()}, 
            Age: #{current_name[:age]}, 
            Gender: #{current_name[:gender].capitalize()}, 
            Nationality: #{current_name[:nationality].capitalize()}, 
            Cohort: #{current_name[:cohort].capitalize()} "
        index += 1
    end
 
end
#finally we print the total number of students
def print_footer(names)
    puts "Overall, we have #{names.count} great students".center(45)
end

print_header
print(students)
print_footer(students)