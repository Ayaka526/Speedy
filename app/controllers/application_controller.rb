class ApplicationController < ActionController::Base
	before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    feeds_top_path # ログイン後に遷移
  end

  def after_sign_out_path_for(resource)
    home_route_path # ログアウト後に遷移
  end

end
