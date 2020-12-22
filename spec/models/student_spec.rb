require 'rails_helper'

RSpec.describe Student, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :house}
  end

  describe 'relationships' do
    it {should have_many :student_courses}
    it {should have_many(:courses).through(:student_courses)}
  end

  describe 'class methods' do
    harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
      malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )

      dod = Course.create(name:"Defense of the dark arts")
      potions = Course.create(name:"Potions")

      StudentCourse.create(student_id: harry.id, course_id: dod.id)
      StudentCourse.create(student_id: harry.id, course_id: potions.id)
      StudentCourse.create(student_id: malfoy.id, course_id: potions.id)

      dod.students_per_course == 1
      potions.students_per_course == 2
  end

end
