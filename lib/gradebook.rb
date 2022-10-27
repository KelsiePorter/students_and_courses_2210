require 'pry'

class Gradebook 
  attr_reader :instructor,
              :courses,
              :all_students

  def initialize(instructor)
    @instructor = instructor
    @courses = []
    @all_students = []
  end

  def add_course(course)
    @courses << course
  end  

end