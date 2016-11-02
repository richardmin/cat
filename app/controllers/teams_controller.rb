class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end
  
  def show
    @team = Team.find(params[:id])
  end
  
  def new 
  end
  
  #def create
  #  @team = Team.new(params[team_params])
  #  if @team.save
  #    #handle a successful save
  #  else
  #    render 'new'
  #end
  
  private
    def team_params
      params.require(:team).permit(:team_type)
    end
end
