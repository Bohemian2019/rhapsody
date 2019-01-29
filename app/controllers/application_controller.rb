class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :name_kana, :postal_code, :address, :phone_number, :email,:password,:password_confirmation])
  end

  def after_sign_in_path_for(resource)
    case resource
     when User
      user_path(resource)
     when Administrator
      admin_index_path
  end
  end

   # 管理者、ユーザ共に未ログイン時:authenticate_user!
  def authenticate_admin
    if current_administrator.nil? and current_user.nil?
      authenticate_user!
    end
  end
end