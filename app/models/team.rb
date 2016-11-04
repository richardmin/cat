class Team < ActiveRecord::Base
  validates :team_type, presence: true
  #serialize :users, Array    #maybe use this to store array of users in team table
  #has_many :users
  #has_one :user1, class_name: 'User'
  #has_one :user2, class_name: 'User'
  #has_one :user3, class_name: 'User'
  #has_one :user4, class_name: 'User'
  #has_one :user5, class_name: 'User'
  #has_one :user6, class_name: 'User'
  belongs_to :team_type
  
  

  def self.new_for(teamConfig, first_user)
  
    # users = User.find_by(rank: rank)
    # users = User.find_by(looking: true).sort(ascending)
	
	
	team_users = []	
	@dps_users = []
	@support_users = []
	@tank_users = []
	
	
	support_users = UserLookingForTeam.where(role: "support")      #if no role specified, role = support as default
    num_support_users = support_users.count
	
    tank_users = UserLookingForTeam.where(role: "tank")
	num_tank_users = tank_users.count
    
    dps_users = UserLookingForTeam.where(role: "dps")
	num_dps_users = dps_users.count
	
    num_support_needed =  teamConfig.num_support
    num_tank_needed =     teamConfig.num_tank
    num_DPS_needed =      teamConfig.num_DPS
	
	if  num_support_users < num_support_needed || 
		num_tank_users < num_tank_needed || 
		num_support_users < num_support_needed 
			return "not enough people, roles in queue: " + num_dps_users.to_s + "  " + num_tank_users.to_s + "    " + num_support_users.to_s
	end
			
			
	#get the team members
	support_users = support_users.slice(0, num_support_needed)
	tank_users = tank_users.slice(0, num_tank_needed)
	dps_users = dps_users.slice(0, num_DPS_needed)
	
	#create the team
	support_users.each { |user| team_users.push(user) }
	tank_users.each { |user| team_users.push(user) }
	dps_users.each { |user| team_users.push(user) }
	
  #team must be 6 people
  if team_users.size != 6
    return nil
  end
  
	#remove the just added people from the queue
	support_users.each { |user| UserLookingForTeam.destroy(user) }
	dps_users.each { |user| UserLookingForTeam.destroy(user) }
	tank_users.each { |user| UserLookingForTeam.destroy(user) }
	
	#return num_dps_users, num_support_users, num_tank_users
	return team_users
#    team = Team.new(team_config_id: teamConfig.id, users: team_users)
  end
end
