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
    return nil if User.count < 6
    # users = User.find_by(rank: rank)
    # users = User.find_by(looking: true).sort(ascending)

    num_support_needed =  teamConfig.num_support
    num_tank_needed =     teamConfig.num_tank
    num_DPS_needed =      teamConfig.num_DPS

    if (first_user.role == nil || first_user.role == "support")
      num_support_needed -= 1
    elsif (first_user.role == "tank")
      num_tank_needed -= 1
    elsif (first_user.role == "dps")
      num_DPS_needed -= 1
    end
    team_users = []
    #team_users.push(first_user.id)
    team_users.push(first_user)
    
    #if no role specified, role = support as default
    support_users = User.where.not(id: first_user.id).where(role: "support")      
    support_users = support_users.slice(0, num_support_needed)
    support_users.each { |user| team_users.push(user) }
    if ( support_users.size < num_support_needed )
      num_support_needed -= support_users.size
      nil_users = User.where.not(id: first_user.id).where(role: nil)
      nil_users = nil_users.slice(0, num_support_needed)
      nil_users.each { |user| team_users.push(user) }
    end
    
    
    tank_users = User.where.not(id: first_user.id).where(role: "tank")
    tank_users = tank_users.slice(0, num_tank_needed)
    tank_users.each { |user| team_users.push(user) }
    
    dps_users = User.where.not(id: first_user.id).where(role: "dps")
    dps_users = dps_users.slice(0, num_DPS_needed)
    dps_users.each { |user| team_users.push(user) }

#    team_users = first_user, support_users, tank_users, dps_users
    if (team_users.size != 6)
      #flash[:error] = "Not 6 people???? HOw??."
      #redirect_to help_url
      return nil
    end
    return team_users
#    team = Team.new(team_config_id: teamConfig.id, users: team_users)
  end
end
