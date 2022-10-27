require './lib/student'
require './lib/course'
require './lib/gradebook'

RSpec.describe Gradebook do 

  it 'gradebook as an instructor' do 
    gradebook = Gradebook.new("Kelly Karg")

    expect(gradebook.instructor).to eq("Kelly Karg")
  end

  it 'gradebook has courses' do 
    gradebook = Gradebook.new("Kelly Karg")
    course1 = Course.new("Calculus", 2)
    course2 = Course.new("Science", 3)

    expect(gradebook.courses).to eq([])
  end

end