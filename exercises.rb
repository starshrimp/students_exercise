class Exercise
  attr_accessor :student_id, :lecture_id, :exercise_name, :percentage_achieved
  def initialize (student_id, lecture_id, exercise_name, percentage_achieved)
    @student_id = student_id
    @lecture_id = lecture_id
    @exercise_name = exercise_name
    @percentage_achieved = percentage_achieved
    @lecture
    @student
  end
  def output(student)
    if student_id == student.id
      puts "Lecture ID: #{lecture_id} #{@lecture.title}"
      puts "Exercise Name: #{exercise_name}"
      puts " Student ID #{@student.id} #{@student.full_name}"
      puts "Their result is: percentage achieved: #{percentage_achieved} \n\n"

    end    
  end
  def student_to_exercise(student)
    if student.id == student_id
      @student= student
    end
  end
  def lecture_to_exercise(lecture)
    if lecture.id == lecture_id
      @lecture = lecture
    end
  end
  def group_by
  end

end
