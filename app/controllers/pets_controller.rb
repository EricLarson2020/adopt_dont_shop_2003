class PetsController < ApplicationController

  def index

    @shelter_id = params[:shelter_id]


    @pets = Pet.all

  end

  def show
  @pet = Pet.find(params[:id])
  end

  def new
    @shelter_id = params[:id]
  end

  def create

    shelter = Shelter.find(params[:id])
    pet = shelter.pets.create!(pet_params)

    redirect_to "/shelters/#{shelter.id}/pets"
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  private

  def pet_params
    defaults = {adoption_status: 'adoptable'}
    params.permit(:image, :name, :description, :approximate_age, :sex).reverse_merge(defaults)
  end
end
