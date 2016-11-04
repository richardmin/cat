class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end
  
  def new
#    @team = Team.new(params[team_params])
    teamConfig = TeamConfig.second #can change between default team configuration. see db/seeds.rb
    @team = Team.new_for(teamConfig, current_user)
    if @team.nil?
      flash[:error] = "Team could not be created."
      redirect_to help_url 
    else
      flash[:success] = @team
      redirect_to root_url #redirect_to_chat?
    end
  end
    
  private
    def team_params
      params.require(:team).permit(:team_type)
    end
end
