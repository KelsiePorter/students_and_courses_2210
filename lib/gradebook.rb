class Gradebook 
  attr_reader :instructor,
              :courses

  def initialize(instructor)
    @instructor = instructor
    @courses = []
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

  def students_score_below(threshold)
    students = all_students.select do |student|
      student.grade < threshold
    end
    students
  end

  def all_grades 
    all_grades = all_students.map do |student|
      student.grade
    end
  end

  def grade_range(lower, upper)
    students = all_students.select do |student|
      student.grade.between?(lower, upper) 
    end
    students
  end
end