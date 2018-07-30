class Api::V1::AuthController < ApplicationController
  # before_action :authenticate_user, only: [:create, :show]

  def show
    if current_user
      render json: {
        id: current_user.id,
        username: current_user.username
      }
    else
      render json: [{}], status: 404
    end
  end

  def create
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
