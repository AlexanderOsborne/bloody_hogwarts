require 'rails_helper'

RSpec.describe 'as a visitor', type: :feature do
  describe 'when I visit the index page' do

    it 'I see a list of courses and the number of students enrolled in each' do
      harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
      malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )

      dod = Course.create(name:"Defense of the dark arts")
      potions = Course.create(name:"Potions")

      StudentCourse.create(student_id: harry.id, course_id: dod.id)
      StudentCourse.create(student_id: harry.id, course_id: potions.id)
      StudentCourse.create(student_id: malfoy.id, course_id: potions.id)
      
      visit "/courses"
    
      expect(page).to have_content(dod.name)
      expect(page).to have_content(dod.students_per_course)
      expect(page).to have_content(potions.name)
      expect(page).to have_content(potions.students_per_course)
    end
  end
end