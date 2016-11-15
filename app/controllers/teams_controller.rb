class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end
  
  
  def new()
	
	#if UserLookingForTeam.where( user_id: current_user.id).count != 0
	#	flash[:error] = "already in queue "
	#	redirect_to join_game_url 
	#	return
	#end
	UserLookingForTeam.create( :user_id => current_user.id, :role => params[:role].to_s, :time_queue_started => Time.now)
	
    teamConfig = TeamConfig.first #can change between default team configuration. see db/seeds.rb
	
    @team = Team.new_for(teamConfig, current_user)
    if @team.nil?
      flash[:error] = "Queueing as role " + params[:role]
      redirect_to join_game_url 
    else
      flash[:success] = @team
      redirect_to join_game_url #redirect_to_chat?
    end
  end
  
  def checkTeam()
	if UserLookingForTeam.where(user_id: current_user.id).count == 0 
		flash[:error] = "Done"
		return true
	end
	flash[:error] = "Waiting"
	return false
  end
     
  private
    def team_params
      params.require(:team).permit(:team_type)
    end
end
