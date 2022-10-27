require 'pry'

class Course
  attr_reader :name,
              :capacity

  def initialize(name, capacity)
    @name = name 
    @capacity = capacity
    @students = []
  end

  def enroll

end