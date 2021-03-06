class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:id, :name, :email, :password, :password_confirmation, :gender) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:id, :name, :email, :password, :password_confirmation, :is_female, :date_of_birth)
    end
  end

  def edit; end

  def update; end
end
