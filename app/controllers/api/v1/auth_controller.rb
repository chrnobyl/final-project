class Api::V1::AuthController < ApplicationController
  # before_action :authenticate_user, only: [:create, :show]

  def show
    user = User.find_by(id: params[:id])
    render json: {
      id: current_user.id,
      name: current_user.username
    }
  end

  def create
    binding.pry
    user = User.find_by(username: params[:username])

    if user.present? && user.authenticate(params[:password])
      render json: {
        id: user.id,
        username: user.username,
        jwt: JWT.encode({ user_id: user.id }, ENV['JWT_SECRET'], ENV['JWT_ALGORITHM'])
      }
    else
      render json: {
        error: 'Username or password incorrect'
      }, status: 404
    end
  end
end
