class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def authenticate_admin_or_user!
    return if admin_signed_in? || user_signed_in?

    redirect_to root_path, notice: "Para continuar, efetue login ou registre-se."
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
