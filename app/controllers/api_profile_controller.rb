class ApiProfileController < ApplicationController
  def index
    profiles = Profile.all
    render json: {status: 'SUCCESS', data: profiles}
  end

  def show
    profile = Profile.includes(:skills).find(params[:id])
    render json: {
        status: 'SUCCESS',
        data: {
            id: profile.id,
            position: profile.position,
            experience: profile.exp_period,
            owner_email: profile.user.email,
            skills: profile.skills
        }
    }
  end
end
