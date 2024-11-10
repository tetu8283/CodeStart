class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Deviseのストロングパラメータを設定
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # サインアップとアカウント更新時にnameパラメータを許可
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :name ])
    devise_parameter_sanitizer.permit(:account_update, keys: [ :name ])
  end

  # sign_up後のリダイレクト先を設定
  def after_sign_up_path_for(resource)
    questions_path
  end

  # ログイン後のリダイレクト先を設定
  def after_sign_in_path_for(resource)
    questions_path
  end

  # ログアウト後のリダイレクト先を設定
  def after_sign_out_path_for(resource)
    root_path
  end
end
