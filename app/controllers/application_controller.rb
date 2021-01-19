class ApplicationController < ActionController::Base
    include Pundit
    include PunditExtra
    
    protect_from_forgery with: :exception, prepend: true

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    private
  
    def user_not_authorized
      flash[:notice] = "You are not authorized to perform this action."
      redirect_to(request.referrer || '/')
    end
end
