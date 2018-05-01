class Api::V1::UsersController < Api::ApplicationController
  respond_to :json

  def show
    respond_with User.find(params[:id])
  end
end  