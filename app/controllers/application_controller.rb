class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top, :about]
  before_action :redirect_user,only: :top
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys: [:name])
  end
  
  #def after_sign_in_path_for(resource) 
   # users_path(current_user_id)
  #end
  def show
    user_path(current_user_id)
  end
  
  def redirect_user
    if user_signed_in?
      redirect_to user_path(current_user.id)
    end
  end
  
end
