class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  layout :layout
  protect_from_forgery with: :exception
  before_filter :authenticate_user!
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation) }
  end

  #pajx请求  如果是pajx请求  不引layout
  def render(*args, &block)# 加载模板
    if request.headers['X-PJAX']
      args[0] ||= {}
      args[0][:layout] = false
    end
    super(*args, &block)
  end

  private
  def layout
    # only turn it off for login pages:
    is_a?(Devise::SessionsController) ? false : "application"
    # or turn layout off for every devise controller:

    # devise_controller? && "application"
  end
end
