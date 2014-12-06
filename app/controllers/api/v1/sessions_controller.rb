class Api::V1::SessionsController < ApplicationController
	respond_to :json

	def create
		user = User.where(email: params[:email]).first
    if user && user.authenticate(params[:password])
    	warden.set_user(user, scope: :user)
      render json: user
    else
      render json: "wrong_credentials", status: 401
    end
	end

	def destroy
		warden.logout(:user)

		render json: "logged_out", status: 200
	end
end
