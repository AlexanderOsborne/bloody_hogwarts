require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  describe 'When I visit the student index page' do
    it 'I see a list of students with name, age and house' do
      harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
      malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )

      dod = Course.create(name:"Defense of the dark arts")
      potions = Course.create(name:"Potions")

      StudentCourse.create(student_id: harry.id, course_id: dod.id)
      StudentCourse.create(student_id: harry.id, course_id: potions.id)
      StudentCourse.create(student_id: malfoy.id, course_id: potions.id)
      StudentCourse.create(student_id: malfoy.id, course_id: dod.id)

      visit '/students'

      expect(page).to have_content(harry.name)
      expect(page).to have_content(malfoy.name)
      expect(page).to have_content(harry.age)
      expect(page).to have_content(malfoy.age)
      expect(page).to have_content(malfoy.house)
      expect(page).to have_content(harry.house)

    end
    it 'I see a list of students with name, age and house' do
      harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )

      dod = Course.create(name:"Defense of the dark arts")
      potions = Course.create(name:"Potions")

      StudentCourse.create(student_id: harry.id, course_id: dod.id)
      StudentCourse.create(student_id: harry.id, course_id: potions.id)

      visit "/students/#{harry.id}"

      
      expect(page).to have_content("Defense of the dark arts")
      expect(page).to have_content("Potions")
    end
  end
end