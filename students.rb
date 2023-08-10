class Student
  attr_accessor :id, :full_name, :exercises
  def initialize(id, full_name)
    @id = id
    @full_name = full_name
    @lectures = []
    @exercises = []
  end
  def output
    puts "Student ID Nr. #{id}: #{full_name}"
  end

  def exercises_to_student(exercise)
    if exercise.student_id == id
      @exercises.push(exercise)
    end
  end
end
