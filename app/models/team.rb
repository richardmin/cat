class Team < ActiveRecord::Base
  validates :team_type, presence: true
  #has_many users
  has_one :user1, class_name: 'User'
  has_one :user2, class_name: 'User'
  has_one :user3, class_name: 'User'
  has_one :user4, class_name: 'User'
  has_one :user5, class_name: 'User'
  has_one :user6, class_name: 'User'
  belongs_to :team_type
  
  def self.create_for(teamConfig)
    return nil if users.empty? or users.count < 5
    # users = User.find_by(rank: rank)
    # users = User.find_by(looking: true).sort(ascending)
    
    support_users = User.where(role: "support")
    support_users = support_users.slice(0, teamConfig.num_support)
    
    tank_users = User.where(role: "tank")
    tank_users = tank_users.slice(0, teamConfig.num_tank)
    
    dps_users = User.where(role: "DPS")
    dps_users = dps_users.slice(0, teamConfig.num_users)
    
    team_users = support_users + tank_users + dps_users
    team = Team.create(team_config_id: teamConfig.id, user: team_users)
  end
end
