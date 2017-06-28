class Api::V1::SheltersController < ApplicationController
  def index
    shelters = Shelter.all
    render json: shelters
  end
end
