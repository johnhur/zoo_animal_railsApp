class AnimalsController < ApplicationController
  def index
  		@zoo = params[:zoo_id]
  	 @zoo_animals = Zoo.find_by_id(@zoo)
  	 @animals = @zoo_animals.animals
  end

  def new
  	@animal = Animal.new
  	@zoo = Zoo.find params[:zoo_id]
  end

  def create
  	@zoo = Zoo.find params[:zoo_id]
  	@animal = @zoo.animals.create(animal_params)

  			if @animal.save
  				flash[:success] = "Successfully Created!"
  				redirect_to zoo_animals_path
  			else
  				# show new page again with error messages. 
  				@errors = @animal.errors.full_messages
  				render :new
  			end
  end


  def edit
  	@animal = Animal.find params[:id]
  end

  def update
  	@animal = Animal.find params[:id]
  	@animal.update_attributes(animal_params)

  	if @animal.save
  		flash[:success] = "Successfully Created!"
  		redirect_to zoo_animals_path(@animal.zoo_id)
  	else
  		# show new page again with error messages. 
  		@errors = @animal.errors.full_messages
  		render :new
  	end

  end

  def show
  	@animal = Animal.find params[:id]
  end

  def destroy

  	@animal = Animal.find params[:id]
  	@zoo = @animal.zoo_id
  	@animal.destroy
  	redirect_to zoo_animals_path(@zoo)
  end

  private
  def animal_params
  	animal_params = params.require(:animal).permit(:name, :species)
  end

end
