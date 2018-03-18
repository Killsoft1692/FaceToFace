class PlaceController < ApplicationController
  def index
    if current_user
      # Update user IP
      data = UserInfo.find_by_user_id(current_user)
      data.client_ip = request.env['HTTP_X_REAL_IP'] ||= request.env['REMOTE_ADDR']
      data.save
      # Get users in 50km area from you
      near = UserInfo.near("#{current_user.user_info.latitude}, #{current_user.user_info.longitude}", 50)
      @users = User.joins(:user_info).merge(near).includes(:profiles)
    else
      @users = User.includes(:user_info, :profiles)
    end
  end
end
