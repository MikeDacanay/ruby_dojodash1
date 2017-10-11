class DojosController < ApplicationController
  def index
  	@dojos = Dojo.all
  end

  def new
  end

  def create
  	@dojo = Dojo.new(dojo_params)
  	@dojo.save
  	redirect_to "/"
  end

  private
  	def dojo_params
      params.require(:dojo).permit(:branch, :street, :city, :state)
  	end  
end
