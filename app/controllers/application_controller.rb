class ApplicationController < ActionController::Base
  protected
  def after_sign_in_path_for(resource)
    if UserInfo.exists?(current_user.id)
      root_path
    else
      new_user_user_info_path(current_user.id)
    end
  end
end
