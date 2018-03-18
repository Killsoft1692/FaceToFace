class SkillsController < ApplicationController

  def index
    @skill = Skill.new
    @skills = Skill.where(profile_id: params[:profile_id])
  end

  def create
    @skill = Skill.new(params.require(:skill).permit(:title))
    @skill.profile_id = params[:profile_id]

    if @skill.save
      redirect_to action: 'index'
    end
  end

end
