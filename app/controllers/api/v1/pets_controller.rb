class Api::V1::PetsController < ApplicationController
  before_action :authenticate_user

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

    pets = Pet.by_species(species).by_sex(sex).by_city(city).by_size(size).by_age(age)

    render json: pets
  end

  def show
    pet = Pet.find_by(id: params[:id])
    render json: pet
  end
end
