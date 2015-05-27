class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

before_action :configure_permitted_parameters, if: :devise_controller?

protected

def configure_permitted_parameters
	devise_parameter_sanitizer.for(:sign_up) << :role_id
	devise_parameter_sanitizer.for(:sign_up) << :nome
	devise_parameter_sanitizer.for(:sign_up) << :endereco
	devise_parameter_sanitizer.for(:sign_up) << :telcelular
	devise_parameter_sanitizer.for(:sign_up) << :telfixo
	devise_parameter_sanitizer.for(:sign_up) << :operadora_celular
	devise_parameter_sanitizer.for(:sign_up) << :operadora_fixo
end
end
