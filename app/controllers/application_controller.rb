class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    #　deviseのUserモデルに関わる「ログイン」「新規登録」などのリクエストからパラメーターを取得できる
    devise_parameter_sanitizer.permit(:sign_up, keys: [:profile, :name, :occupation, :position])
  end
end
