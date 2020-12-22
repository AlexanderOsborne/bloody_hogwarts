class StudentsController < ApplicationController

  def index
    @students =Student.all.alphabetize
  end

  def show
    @student = Student.find(params[:id])
  end
end