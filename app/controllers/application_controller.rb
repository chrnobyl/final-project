class ApplicationController < ActionController::API
  include Knock::Authenticable

  private

  def authorize_user!
    if !current_user.present?
      render json: { error: "no user ID present" }
    end
  end

  def current_user
    @current_user ||= User.find_by(id: user_id)
  end



end
