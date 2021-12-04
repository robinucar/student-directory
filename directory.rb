
def input_students
    puts "Please enter the full name of the student:"
    name = gets.chomp.to_sym
    students = []
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
        students << {name: name, age: age, gender: gender, nationality: nationality, cohort: cohort}
        if students.count == 1
            puts "Now we have #{students.count} student."
        else
            puts "Now we have #{students.count} students."
        end
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
        puts "#{index + 1} Full name: #{current_name[:name].to_s.split(/ |\_|\-/).map(&:capitalize).join(" ").to_sym}, 
            Age: #{current_name[:age]}, 
            Gender: #{current_name[:gender].capitalize()}, 
            Nationality: #{current_name[:nationality].capitalize()}, 
            Cohort: #{current_name[:cohort].capitalize()} "
        index += 1
    end
end




#finally we print the total number of students
def print_footer(names)
    if names.count == 1
        puts "Overall, we have #{names.count} great student.".center(45)
    else
        puts "Overall, we have #{names.count} great students.".center(45)
    end
end


print_header
print(students)
print_footer(students)

#grouping students by chort
def group_by_cohort(students)
    puts "Please type the cohort you want to see"
    month = gets.chomp.capitalize().to_sym
    group = students.select { |student| student[:cohort].capitalize() == month }
    group.each do |key, value|
        puts "#{key}: #{value}"
    end
end

group_by_cohort(students)