class ShelterPetsController < ApplicationController

  def index
    @shelter = Shelter.find(params[:id])
  end

  def new
    @shelter = Shelter.find(params[:id])
  end

  def create
    pet_new = Pet.create(pet_params)
    redirect_to "/shelters/#{pet_new.shelter_id}/pets"
  end

  def edit
    @pet_edit = Pet.find(params[:id])
    redirect_to "/pets/#{@pet_edit.shelter_id}"
  end

  private
  def pet_params
    params.permit(:name,:image,:age,:sex,:adoption_status,:description, :shelter_id)
  end

end
