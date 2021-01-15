class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception, prepend: true
    before_action :configure_permitted_parameters, if: :devise_controller?

    private
        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :nickname, :email, :password, :password_confirmation)}
            devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :nickname, :url_image, :email, :password, :password_confirmation)}
        end
end
