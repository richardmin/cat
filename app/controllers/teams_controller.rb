class TeamsController < ApplicationController

	def index
		@teams = Team.all
	end
  
  
	def new
			#check if the user is already waiting, if so - delete their current entry in usersWaiting to replace it
		a = UserLookingForTeam.where( user_id: current_user.id)
		if a.count != 0
			a.delete_all 
		end
		
		#delete old teams that the user belonged to before starting a new queue
		Team.where(user1: current_user.id).delete_all
		Team.where(user2: current_user.id).delete_all
		Team.where(user3: current_user.id).delete_all
		Team.where(user4: current_user.id).delete_all
		Team.where(user5: current_user.id).delete_all
		Team.where(user6: current_user.id).delete_all
		
		UserLookingForTeam.create( :user_id => current_user.id, :role => params[:role].to_s, :time_queue_started => Time.now)
		
			teamConfig = TeamConfig.first #can change between default team configuration. see db migrations for queue
		
			@team = Team.new_for(teamConfig)
=begin
				if @team.nil?
					flash[:error] = "Queueing as role " + params[:role]
					redirect_to join_game_url
				else
					flash[:success] = @team
					redirect_to join_game_url #redirect_to_chat?
				end
=end
		respond_to do |format|
			flash[:error] = "Queueing as role " + params[:role]
			flash[:success] = @team 
			format.html	
		end
	end
  

	def search
		@checkTeam = -1
		check1 = Team.find_by(user1: current_user.id)
		check2 = Team.find_by(user2: current_user.id)
		check3 = Team.find_by(user3: current_user.id)
		check4 = Team.find_by(user4: current_user.id)
		check5 = Team.find_by(user5: current_user.id)
		check6 = Team.find_by(user6: current_user.id)
		
		if check1.nil? && check2.nil? && check3.nil? && check4.nil? &&
			check5.nil? && check6.nil?
			@checkTeam = -1
		elsif !check1.nil?
			@checkTeam = check1.id
		elsif !check2.nil?
			@checkTeam = check2.id
		elsif !check3.nil?
			@checkTeam = check3.id
		elsif !check4.nil?
			@checkTeam = check4.id
		elsif !check5.nil?
			@checkTeam = check5.id
		elsif !check6.nil?
			@checkTeam = check6.id
		end
		
		respond_to do |format|
			format.json {render json: @checkTeam}
		end
	end

end
