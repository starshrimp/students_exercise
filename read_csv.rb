require 'csv'
require "debug"
require_relative "students.rb"
require_relative "lectures.rb"
require_relative "exercises.rb"
@students = []
@lectures = []
@exercises = []
def parse
  parse_students
  parse_lectures
  parse_exercises
end
def parse_students
  CSV.foreach("students.csv", headers: true) do |row|
    id = row[0]
    full_name = row[1]
    student = Student.new(id, full_name)
    @students.push(student)
  end 
end
def parse_lectures
  CSV.foreach("lectures.csv", headers: true) do |row|
    id = row[0]
    title = row[1]
    level = row [2]
    lecture = Lecture.new(id, title, level)
    @lectures.push(lecture)
  end 
end
def parse_exercises
  CSV.foreach("exercises.csv", headers: true) do |row|
    student_id = row[0]
    lecture_id = row[1]
    exercise_name = row [2]
    percentage_achieved = row[3]
    exercise = Exercise.new(student_id, lecture_id, exercise_name, percentage_achieved)
    @exercises.push(exercise)
  end 
end
def output
  output_students
  output_lectures
  output_exercises
end
def output_students
  @students.each do |student|
    student.output
  end
end
def output_lectures
  @lectures.each do |lecture|
    lecture.output
  end
end
def assign_to_exercise
  @exercises.each do |exercise|
    @students.each do |student|
      exercise.student_to_exercise(student)
    end
    @lectures.each do |lecture|
      exercise.lecture_to_exercise(lecture)
    end
  end
end
def output_exercises
  @students.each do |student|
    puts "\n\n\n These exercises were solved by: Student ID #{student.id} #{student.full_name} \n"
    @exercises.each do |exercise|
      student.exercises_to_student(exercise)
      exercise.output(student)
      @lectures.each do |lecture|
       lecture.percentage_achieved(exercise)
      end
    end
  end
end
def most_exercises_solved
  sorted_students= @students.sort_by { |student| -student.exercises.length }
  grouped_students = sorted_students.group_by { |student| student.exercises.length }
  grouped_students.each do |key, objects_array|
    puts "These students solved #{key} exercises"
    objects_array.each do |student|
      puts "• #{student.id} #{student.full_name}"
    end
  end
end
def highest_percentage
  @lectures.each do |lecture| 
    lecture.average_percentage
  end
  puts "\n\n"
  sorted_lectures= @lectures.sort_by { |lecture| -lecture.average }
  sorted_lectures.each do |lecture|
    if lecture.average != 0
      puts "The lecture '#{lecture.title}' had an average of #{lecture.average}."
    end
  end
end

parse
assign_to_exercise
output
most_exercises_solved
highest_percentage
