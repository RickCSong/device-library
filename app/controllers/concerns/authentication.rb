module Authentication
  extend ActiveSupport::Concern

  protected

  def current_user
    @current_user ||= begin
      user = User.find_by(
        username: current_username,
        first_name: current_first_name,
        last_name:  current_last_name,
      )

      unless user
        user = User.find_or_create_by(
          username: current_username,
        )
        user.update_attributes(
          first_name: current_first_name,
          last_name:  current_last_name,
        )
      end
      user
    end
  end

  def require_admin_permission
    unless current_user.admin?
      respond_to do |format|
        format.json { render json: {errors: {role: 'must be an admin to perform this'}}.to_json, status: :forbidden }
      end
    end
  end

  def require_terminal_permission
    unless current_user.terminal? || current_user.admin?
      respond_to do |format|
        format.json { render json: {errors: {role: 'must be a terminal to perform this'}}.to_json, status: :forbidden }
      end
    end
  end
end
