class UserInfoController < ApplicationController

  def new
    @user_info = UserInfo.new
  end

  def create
    @user_info = UserInfo.new(
        params.require(:user_info).permit(
            :first_name,
            :last_name,
            :age,
            :facebook,
            :twitter,
            :github,
            :country,
            :city
        )
    )
    @user_info.user = current_user
    @user_info.client_ip = request.env['HTTP_X_REAL_IP'] ||= request.env['REMOTE_ADDR']
    if @user_info.save
      redirect_to new_profile_path
    end
  end
end
