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
  	@ninja = Student.find(params[:student_id])
  	@all_students = Student.where(dojo: params[:dojo_id])
  end

  def edit
  	@ninja = Student.find(params[:student_id])
  end

  def update
 	render json: params
  end

  private
  	def student_params
  		params.require(:student).permit(:first_name, :last_name, :email, :dojo_id)
	end  		
end
