class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :null_session

  helper_method :user_signed_in?, :current_user, :warden

  def authenticate_user!
    if !user_signed_in?
      render json: {message: "unauthorized.user"}, status: 401
    end
  end

  def render_404
    render json: {message: 'not_found'}, head: :not_found, status: 404
  end

  def render_permission_denied
    render json: {message: "permission_denied"}, status: 403
  end

  def current_user
  	if user_signed_in?
  		@current_user ||= begin
  			user_id = warden.user(:user).id
  			User.find(user_id)
  		end
  	end
  end

  def user_signed_in?
  	warden.authenticated?(:user)
  end

  def warden
    request.env["warden"]
  end

  def page_params
    params.permit(:page, :per_page)
  end

  def query_params
    {}    
  end

end
