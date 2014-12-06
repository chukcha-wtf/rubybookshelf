class Api::V1::UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :set_user, only: [:show, :update, :destroy]
	respond_to :json

	def index
    users = {"users" => User.all}
    respond_with users
	end

	def show
    user = {"user" => @user}
    respond_with user
	end

  def create
    @user = User.create(user_params)
    user = {"user" => @user}
    respond_with user
  end

	private
		def set_user
			user_id = params[:id] == 'current' ? current_user.id : params[:id]
			@user = User.find(user_id)
		end

    def user_params
      params.require(:user).permit(:fullname, :bio, :password, :password_confirmation, :email)
    end

end
