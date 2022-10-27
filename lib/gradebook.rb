require 'pry'

class Gradebook 
  attr_reader :instructor,
              :courses
              # :all_students

  def initialize(instructor)
    @instructor = instructor
    @courses = []
    # @all_students = []
  end

  def add_course(course)
    @courses << course
  end  

  def all_students 
    students = @courses.map do |course|
      course.students
    end
    students.flatten!
  end

  def students_score_below_80
    students_below_80 = all_students.select do |student|
      student.grade < 80.0
    end
    students_below_80
  end

end