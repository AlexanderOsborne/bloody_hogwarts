# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )


dod = Course.create(name:"Defense of the dark arts")
potions = Course.create(name:"Potions")
StudentCourse.create(student_id: harry.id, course_id: dod.id)
StudentCourse.create(student_id: harry.id, course_id: potions.id)
StudentCourse.create(student_id: malfoy.id, course_id: potions.id)
StudentCourse.create(student_id: malfoy.id, course_id: dod.id)
      