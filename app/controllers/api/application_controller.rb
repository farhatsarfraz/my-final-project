class Api::ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods
  # protect_from_forgery with: :null_session
  # acts_as_token_authentication_handler_for User, fallback: :none
  before_action :authenticate_user!

  def current_user
    @current_user ||= User.find_by(authentication_token: current_token)
  end

  def authenticate_user!
    unless current_user
      render json: {nothing: "Invalid token"}, status: :unauthorized
    end
  end
  private

  def current_token
    authenticate_with_http_token do |token, options|
      token || 'Nothing'
    end
  end
end
