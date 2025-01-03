class ApplicationController < ActionController::Base
  # allow_browser versions: :modern
  before_action :configure_permitted_parameters, if: :devise_controller?

  # ログイン後のリダイレクト先を指定
  def after_sign_in_path_for(_resource)
    shifts_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname])
  end
end
