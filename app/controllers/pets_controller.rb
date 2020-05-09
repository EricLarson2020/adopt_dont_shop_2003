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
    pet = Pet.create!(pet_params)
    binding.pry
  end

  private

  def pet_params
    params.permit(:image, :name, :description, :approximate_age, :sex, adoption_status: 'adoptable')
  end
end
