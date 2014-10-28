class Api::V1::UnauthorizedController < ApplicationController

	def self.call(env)
    @respond ||= action(:respond)
    @respond.call(env)
  end

  def respond
    message = env['warden.options'].fetch(:message, "unauthorized.user")
    render json: message, status: 401
  end
end