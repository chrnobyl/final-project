class Api::V1::AuthController < ApplicationController
  before_action :authorize_user, only: [:show]

  def show
    render json: {
      id: current_user.id,
      name: current_user.username
    }
  end

  def create
    user = User.find_by(email: params[:email])

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
