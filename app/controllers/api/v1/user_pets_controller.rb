class Api::V1::UserPetsController < ApplicationController
  def index
    user_pets = User.first.pets
    render json: user_pets
  end

  def create
    user_pet = UserPet.create(user_pet_params)
    pet = Pet.find_by(id: user_pet.pet_id)
    render json: pet
  end

  def show
    user_pet = UserPet.find_by(id: params[:id])
    render json: user_pet
  end

  def destroy
    user_pet = UserPet.find_by(id: params[:id])
    user_pet.destroy
    render json: user_pet
  end

  private
  def user_pet_params
    params.require(:user_pet).permit(:user_id, :pet_id)
  end

end
