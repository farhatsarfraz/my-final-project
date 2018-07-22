class Users::InvitationsController < Devise::InvitationsController

  def create
    existing_user = User.find_by(email: params[:user][:email])

    puts "existing user"
    if existing_user.present?
      puts "-------- already------------\n"*15
      redirect_to root_path, notice: 'This user has been invited already or a registered user.'
    else
      User.invite!(email: params[:user][:email], role: params[:user][:role])
      redirect_to root_path, notice: 'User has been invited successfully.'
    end
  end
end
