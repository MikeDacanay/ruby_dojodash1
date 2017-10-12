class DojosController < ApplicationController
  def index
  	@dojos = Dojo.all
  end

  def new
  end

  def create
  	@dojo = Dojo.new(dojo_params)
  	@dojo.save
  	if @dojo.errors.full_messages.length > 0
  		flash[:errors] = @dojo.errors.full_messages
  		redirect_to "/dojos/new"
  	else
  		redirect_to '/'
  	end
  end

  def show
    @doj = Dojo.find(params[:id])
    @students = Student.where(dojo: params[:id])
  end

  def edit
    @doj = Dojo.find(params[:id])
  end

  def update
    dojo = Dojo.find(params[:id])
    edit = params[:dojo]
    dojo[:branch] = edit[:branch]
    dojo[:city] = edit[:city]
    dojo[:state] = edit[:state]
    dojo[:street] = edit[:street]
    dojo.save
    redirect_to "/"
  end

  def destroy
    Dojo.find(params[:id]).destroy
    redirect_to "/"
  end
  
  private
  	def dojo_params
      params.require(:dojo).permit(:branch, :street, :city, :state)
  	end  
end
