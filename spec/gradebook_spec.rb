require './lib/student'
require './lib/course'
require './lib/gradebook'

RSpec.describe Gradebook do 
  it 'gradebook as an instructor' do 
    gradebook = Gradebook.new("Kelly Karg")

    expect(gradebook.instructor).to eq("Kelly Karg")
  end

  it 'gradebook has no courses by default' do 
    gradebook = Gradebook.new("Kelly Karg")
    course1 = Course.new("Calculus", 2)
    course2 = Course.new("Science", 3)

    expect(gradebook.courses).to eq([])
  end

  it 'gradebook can add courses' do 
    gradebook = Gradebook.new("Kelly Karg")
    course1 = Course.new("Calculus", 2)
    course2 = Course.new("Science", 3)

    gradebook.add_course(course1)
    gradebook.add_course(course2)

    expect(gradebook.courses).to eq([course1, course2])
  end

  it 'gradebook can list all students in its courses' do 
    gradebook = Gradebook.new("Kelly Karg")
    course1 = Course.new("Calculus", 2)
    course2 = Course.new("Science", 3)
    student1 = Student.new({name: "Morgan", age: 21})
    student2 = Student.new({name: "Jordan", age: 29}) 
    student3 = Student.new({name: "Bodi", age: 33})
    student4 = Student.new({name: "Dean", age: 32})
    student5 = Student.new({name: "Karl", age: 84})

    course1.enroll(student1)
    course1.enroll(student2)
    course2.enroll(student3)
    course2.enroll(student4)

    gradebook.add_course(course1)
    gradebook.add_course(course2)

    expect(gradebook.all_students).to eq([student1, student2, student3, student4])
  end

  it 'gradebook can return students with a score below a threshold' do 
    gradebook = Gradebook.new("Kelly Karg")
    course1 = Course.new("Calculus", 2)
    course2 = Course.new("Science", 3)
    student1 = Student.new({name: "Morgan", age: 21})
    student2 = Student.new({name: "Jordan", age: 29}) 
    student3 = Student.new({name: "Bodi", age: 33})
    student4 = Student.new({name: "Dean", age: 32})

    student1.log_score(92)
    student2.log_score(78)
    student3.log_score(80)
    student4.log_score(65)

    expect(student1.scores).to eq([92])

    course1.enroll(student1)
    course1.enroll(student2)
    course2.enroll(student3)
    course2.enroll(student4)

    expect(course1.students[0].scores).to eq([92])

    gradebook.add_course(course1)
    gradebook.add_course(course2)

    expect(gradebook.students_score_below(80)).to eq([student2, student4])
    expect(gradebook.students_score_below(70)).to eq([student4])

  end

  it 'gradebook can track all grades across all courses' do 
    gradebook = Gradebook.new("Kelly Karg")
    course1 = Course.new("Calculus", 2)
    course2 = Course.new("Science", 3)
    student1 = Student.new({name: "Morgan", age: 21})
    student2 = Student.new({name: "Jordan", age: 29}) 
    student3 = Student.new({name: "Bodi", age: 33})
    student4 = Student.new({name: "Dean", age: 32})

    student1.log_score(92)
    student1.log_score(92)
    student2.log_score(78)
    student3.log_score(80)
    student4.log_score(65)

    course1.enroll(student1)
    course1.enroll(student2)
    course2.enroll(student3)
    course2.enroll(student4)

    gradebook.add_course(course1)
    gradebook.add_course(course2)

    expect(gradebook.all_grades).to eq([92.0, 78.0, 80.0, 65.0])
  end

  it 'gradebook can track students that fall within a specific grade range' do
    gradebook = Gradebook.new("Kelly Karg")
    course1 = Course.new("Calculus", 2)
    course2 = Course.new("Science", 3)
    student1 = Student.new({name: "Morgan", age: 21})
    student2 = Student.new({name: "Jordan", age: 29}) 
    student3 = Student.new({name: "Bodi", age: 33})
    student4 = Student.new({name: "Dean", age: 32})

    student1.log_score(92)
    student1.log_score(98)
    student2.log_score(78)
    student3.log_score(80)
    student4.log_score(65)
    student4.log_score(95)

    course1.enroll(student1)
    course1.enroll(student2)
    course2.enroll(student3)
    course2.enroll(student4)

    gradebook.add_course(course1)
    gradebook.add_course(course2) 

    expect(student1.grade).to eq(95)
    expect(student2.grade).to eq(78)
    expect(student3.grade).to eq(80)
    expect(student4.grade).to eq(80)

    expect(gradebook.grade_range(75, 85)).to eq([student2, student3, student4])
    expect(gradebook.grade_range(86, 100)).to eq([student1])
    expect(gradebook.grade_range(0, 74)).to eq([])
  end
end