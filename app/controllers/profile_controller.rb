class ProfileController < ApplicationController
  before_action :authenticate_user!, except: :show
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  def index
    @profiles = current_user.profiles
  end

  def show
  end

  def new
    @profile = Profile.new
  end

  def edit
  end

  def create
    @profile = Profile.new(get_params)
    @profile.user = current_user
    if @profile.save
      redirect_to profile_skills_path(@profile.id)
    end
  end

  def update
    if @profile.user != current_user
      raise ActionController::RoutingError.new('You must be owner to do this')
    else
      if @profile.update(get_params)
        redirect_to root_path
    end
    end
  end

  def destroy
    if @profile.user == current_user
      @profile.destroy
      redirect_to root_path
    else
      raise ActionController::RoutingError.new('You must be owner to do this')
    end
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def get_params
    params.require(:profile).permit(:position, :exp_period)
  end

end
