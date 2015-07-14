class ZoosController < ApplicationController
	before_action :find_zoo, only: [:show, :edit, :update, :destroy]

  def index
  	@zoos = Zoo.all
  end

  def new
  	@zoo = Zoo.new
  end

  def create
  	@zoo = Zoo.create(zoo_params)

  			if @zoo.save
  				flash[:success] = "Successfully Created!"
  				redirect_to zoos_path
  			else
  				# show new page again with error messages. 
  				@errors = @zoo.errors.full_messages
  				render :new
  			end

  end


  def edit
  	
  end

  def update
  	@zoo = Zoo.find_by_id(params[:id])
  	@zoo.update_attributes(zoo_params)
  	if @zoo.save
  		flash[:success] = "Successfully Update!"
  		redirect_to zoos_path
  	else
  		@errors = @zoo.errors.full_messages
  		render :edit
  	end
  end

  def show
  	
  end

  def destroy
  	
  	@zoo.destroy
  	redirect_to zoos_path, notice: "#{@zoo[:name]} was deleted from this application :("
  end


  private
  	def find_zoo
  		@zoo = Zoo.find_by_id params[:id]
  	end

  	def zoo_params
  		zoo_params = params.require(:zoo).permit(:name, :location, :year_opened)
  	end

end
