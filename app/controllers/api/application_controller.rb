class Api::ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  acts_as_token_authentication_handler_for User
  before_action :authenticate_user!

  def current_user
    @current_user ||= User.find_by(authentication_token: current_token)
  end

  def authenticate_user!
    unless current_user
      render json: {nothing: true}, status: :unauthorized
    end

  end
  private

  def current_token
    authenticate_with_http_token do |token, options|
      User.find_by(authentication_token: token)
    end
  end

end
