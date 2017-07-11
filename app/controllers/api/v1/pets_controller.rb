class Api::V1::PetsController < ApplicationController
  def index
    pets = Pet.all
    render json: pets
  end

  def create

    species = params[:species] || '%'
    sex = params[:sex] || '%'
    city = params[:city] || '%'
    size = params[:size] || '%'
    age = params[:age] || '%'
    pets = Pet.by_species(species).by_sex(sex)

    render json: pets
  end

  def show
    pet = Pet.find_by(id: params[:id])
    render json: pet
  end
end
