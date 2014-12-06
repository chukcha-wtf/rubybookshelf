class Api::V1::SessionsController < ApplicationController
	respond_to :json

	def create
		user = User.where(email: params[:email]).first
    if user && user.authenticate(params[:password])
    	warden.set_user(user, scope: :user)
      render json: {"user": user}
    else
      render json: {message: "wrong_credentials"}, status: 401
    end
	end

	def destroy
		warden.logout(:user)

		render json: {message: "logged_out"}, status: 200
	end
end
