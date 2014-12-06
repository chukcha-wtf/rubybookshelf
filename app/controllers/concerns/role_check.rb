module RoleCheck
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_user!
    before_action :check_guest_access, except: [:index, :show]
  end

  def check_guest_access
    if current_user && current_user.is_a_guest?
      render_permission_denied
    end
  end

end