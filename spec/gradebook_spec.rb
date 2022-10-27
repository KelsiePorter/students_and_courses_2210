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

    gradebook.add_course(course1)
    gradebook.add_course(course2)

    expect(gradebook.courses).to eq([course1, course2])
  end

  it 'gradebook can add courses' do 
    gradebook = Gradebook.new("Kelly Karg")
    course1 = Course.new("Calculus", 2)
    course2 = Course.new("Science", 3)
    student1 = Student.new({name: "Morgan", age: 21})
    student2 = Student.new({name: "Jordan", age: 29}) 
    student3 = Student.new({name: "Bodi", age: 33})
    student4 = Student.new({name: "Dean", age: 32})

    course1.enroll(student1)
    course1.enroll(student2)
    course2.enroll(student3)
    course2.enroll(student4)

    expect(course1.students).to eq([student1, student2])
    expect(course2.students).to eq([student3, student4])

    gradebook.add_course(course1)
    gradebook.add_course(course2)

    expect(gradebook.courses).to eq([course1, course2])
  end

  it 'gradebook can list all students in its courses' do 
  end

end