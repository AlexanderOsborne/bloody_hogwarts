class StudentsController < ApplicationController

  def index
    @students =Student.all.alphabetize
    @average_age = (@students.average_age)
  end

  def show
    @student = Student.find(params[:id])
  end
end