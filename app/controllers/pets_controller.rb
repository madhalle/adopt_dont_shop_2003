class PetsController < ApplicationController

  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def edit
    @pet = Pet.find(params[:id])
    redirect_to "/pets/#{@pet.shelter_id}"

  end

  private
  def pet_params
    params.permit(:name,:image,:age,:sex,:adoption_status,:description, :shelter_id)
  end
end
