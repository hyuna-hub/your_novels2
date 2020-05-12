class ApplicationController < ActionController::Base

	protect_from_forgery with: :exception

# サインアップ時にユーザー名を保存
  	before_action :configure_permitted_parameters, if: :devise_controller?
  	def configure_permitted_parameters
    	devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  	end

# ログイン・ログアウト後の遷移先
	def after_sign_in_path_for(resource)
    	user_path(current_user)
  	end

  	def after_sign_out_path_for(resource)
    	root_path
  	end
end
