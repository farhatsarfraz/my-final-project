module Api
  class SessionsController <  Api::ApplicationController
    skip_before_action :authenticate_user!, only: [:create]

    def create
      user = User.find_for_database_authentication(:email => session_params[:email])
      user ||= User.new

      if user.valid_password?(session_params[:password])
        render json: { authentication_token: user.authentication_token }
      else
        invalid_login_attempt
      end
    end

    def destroy
      current_user.invalidate_auth_token
      current_user.save
      head :ok
    end

    private

    def session_params
      params.require(:user).permit(:email, :password)
    end

    def invalid_login_attempt
      render json: { errors: [ { detail:"Error with your login or password" }]}, status: 401
    end
  end
end
