class Users::InvitationsController < Devise::InvitationsController
  before_action :is_admin?

  def create
    existing_user = User.find_by(email: params[:user][:email])

    puts "existing user"
    if existing_user.present?
      redirect_to root_path, notice: 'This user has been invited already or a registered user.'
    else
      ActiveRecord::Base.transaction do
        begin
          if User.invite!(email: params[:user][:email], role: params[:user][:role])
            redirect_to root_path, notice: 'User has been invited successfully.'
          else
            redirect_to root_path, notice: 'Problem sending the inviataion to user: #{params[:user][:email]}.'
          end
        rescue
          user = User.find_by(email: params[:user][:email])
          user.destroy if user.present?
          redirect_to root_path, notice: "Problem sending the inviataion to user: #{params[:user][:email]}."
        end
      end
    end
  end

  private

  def is_admin?
    redirect_to root_path unless current_user.admin
  end
end
