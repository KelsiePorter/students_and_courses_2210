require './lib/student'
require './lib/course'

RSpec.describe Course do 

  it 'course has a name and a capacity' do 
    course = Course.new("Calculus", 2)

    expect(course.name).to eq("Calculus")
    expect(course.capacity).to eq(2)
  end

  it 'course can have students enroll' do 
    course = Course.new("Calculus", 2)

    expect(course.students).to eq([])
    expect(course.full?).to be false
  end

  it 'course has enrolled students' do 
    course = Course.new("Calculus", 2)
    student1 = Student.new({name: "Morgan", age: 21})
    student2 = Student.new({name: "Jordan", age: 29})   

    course.enroll(student1) 
    course.enroll(student2)

    expect(course.students).to eq([student1, student2])
    expect(course.full?).to be true
  end
end