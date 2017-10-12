class StudentsController < ApplicationController

  def new
  	flash[:dojo_id]=params[:id]
  end

  def create
  	temp = Student.new(student_params)
  	temp.save
  	redirect_to "/dojos/#{params[:id]}"
  end

  def show
  end

  def edit
  end

  private
  	def student_params
  		params.require(:student).permit(:first_name, :last_name, :email, :dojo_id)
	end  		
end
