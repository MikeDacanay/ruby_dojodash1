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

  private
  	def dojo_params
      params.require(:dojo).permit(:branch, :street, :city, :state)
  	end  
end
