module Api
  class SessionsController <  Api::ApplicationController
    skip_before_action :authenticate_user!, only: [:create]

    def create
      user = User.find_for_database_authentication(:email => params[:email])
      user ||= User.new

      puts params.inspect
      if user.valid_password?(params[:password])
        render json: { authentication_token: user.authentication_token }
      else
        invalid_login_attempt
      end
    end

    def destroy
      current_user.invalidate_auth_token
      head :ok
    end

    private
    def invalid_login_attempt
      render json: { errors: [ { detail:"Error with your login or password" }]}, status: 401
    end
  end
end
