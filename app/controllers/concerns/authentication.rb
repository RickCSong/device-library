module Authentication
  extend ActiveSupport::Concern

  protected

  def find_current_user
    current_user
  end

  def current_user
    @current_user ||= User.find_or_create_by(
      username: current_username,
    )
    @current_user.update_attributes(
      first_name: current_first_name,
      last_name:  current_last_name,
    )
    @current_user
  end

  def require_admin_permission
    if current_user.admin?
      true
    else
      respond_to do |format|
        format.json { render json: {errors: {role: 'must be an admin to perform this'}}.to_json, status: :forbidden }
      end
      false
    end
  end

  def require_terminal_permission
    if current_user.terminal? || current_user.admin?
      true
    else
      respond_to do |format|
        format.json { render json: {errors: {role: 'must be a terminal to perform this'}}.to_json, status: :forbidden }
      end
      false
    end
  end
end
