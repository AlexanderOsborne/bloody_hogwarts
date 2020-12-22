require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  describe 'when I visit a student show page' do
    it 'I see a list of classes that student attends' do
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