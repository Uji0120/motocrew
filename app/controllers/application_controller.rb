class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def after_sign_in_path_fo(resouece)
    case resource
    when User
      root_path
    when Admin
      admin_posts_path
    end
  end


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :first_name, :last_name, :first_name_kana, :last_name_kana, :telephone_number, :postal_cade, :address])
  end
end
