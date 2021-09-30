class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  def after_sign_in_path_for(resource)
    flash[:notice] = "Привет, #{current_user.name}! "
    resource.admin? ? admin_tests_path : tests_path
  end

  private

  def default_url_options
    { lang: I18n.locale }
  end

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:name, :surname, :email, :password)
    end
  end
end
