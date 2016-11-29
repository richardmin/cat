class Team < ActiveRecord::Base
  #serialize :users, Array  #maybe use this to store array of users in team table
  belongs_to :team_type
  
  
  def self.new_for(teamConfig)
  
  # users = User.find_by(rank: rank)
  # users = User.find_by(looking: true).sort(ascending)
  
  
  team_users = [] 
  @dps_users = []
  @support_users = []
  @tank_users = []
  
  
  support_users = UserLookingForTeam.where(role: "support")    
  num_support_users = support_users.count
  
  tank_users = UserLookingForTeam.where(role: "tank")
  num_tank_users = tank_users.count
  
  dps_users = UserLookingForTeam.where(role: "dps")
  num_dps_users = dps_users.count
  
  num_support_needed =  teamConfig.num_support
  num_tank_needed =   teamConfig.num_tank
  num_DPS_needed =    teamConfig.num_DPS
  
  if  num_support_users < num_support_needed || 
    num_tank_users < num_tank_needed || 
    num_dps_users < num_DPS_needed 
      return "not enough people, roles in queue: " + num_dps_users.to_s + "  " + num_tank_users.to_s + "  " + num_support_users.to_s
  end
      
  
      
  #get the team members
  support_users = support_users.slice(0, num_support_needed)
  tank_users = tank_users.slice(0, num_tank_needed)
  dps_users = dps_users.slice(0, num_DPS_needed)
  
  #create the team
  support_users.each { |user| team_users.push(user) }
  tank_users.each { |user| team_users.push(user) }
  dps_users.each { |user| team_users.push(user) }

  
  #remove the just added people from the queue
  support_users.each { |user| UserLookingForTeam.destroy(user) }
  dps_users.each { |user| UserLookingForTeam.destroy(user) }
  tank_users.each { |user| UserLookingForTeam.destroy(user) }
  
  #user_ids = [ team_users[0].user_id, team_users[1].user_id,  team_users[2].user_id,  
  #team_users[3].user_id,  team_users[4].user_id,  team_users[5].user_id ]   
  
  t = Team.create( :team_config_id => teamConfig.id, :user1 => team_users[0].user_id,
    :user2 => team_users[1].user_id, :user3 => team_users[2].user_id, :user4 => team_users[3].user_id,
    :user5 => team_users[4].user_id, :user6 => team_users[5].user_id)
  if ( !t.valid? )
    #return teamConfig.id
    return nil
  end
  
  
  return team_users
  end
end
