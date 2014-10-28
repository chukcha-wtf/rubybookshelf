class Api::V1::UsersController < ApplicationController
	before_action :authenticate_user!
	respond_to :json

	def index
    render json: User.all.to_json(except: [:password_digest, :created_at, :updated_at])
	end

end
