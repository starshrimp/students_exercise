require "debug"
class Lecture
  attr_accessor :id, :title, :level, :percentages, :average
  def initialize(id,title,level)
    @id = id
    @title = title
    @level = level
    @exercises = []
    @percentages =[]
    @average = 0
  end
  def output
    puts "Lecture ID #{id}: #{title} at the #{level} level."
  end
  def exercise_to_lecture(exercise)
    if exercise.lecture_id == id
      @exercises.push(exercise)
    end
  end
  def percentage_achieved(exercise)
    if exercise.lecture_id == id
      @percentages.push(exercise.percentage_achieved)
    end
  end
  def average_percentage
    sum = 0
    if @percentages.length != 0
      @percentages.each do |element|
        sum += element.to_f
      end
      average = sum.to_f / @percentages.length
      @average = average.round(1)
      return average
    end
  end
end
