require './lib/student'

RSpec.describe Student do
  it 'student has a name and an age' do 
    student = Student.new({name: "Morgan", age: 21}) 

    expect(student.name).to eq("Morgan")
    expect(student.age).to eq(21)
  end

  it 'student has an array of logged scores' do
    student = Student.new({name: "Morgan", age: 21}) 

    expect(student.scores).to eq([])

    student.log_score(89)
    student.log_score(78)

    expect(student.scores).to eq([89, 78])
    expect(student.scores.size).to eq(2)
  end

  it 'student has an average score' do 
    student = Student.new({name: "Morgan", age: 21}) 

    student.log_score(89)
    student.log_score(78)

    expect(student.grade).to eq(83.5)
  end
end