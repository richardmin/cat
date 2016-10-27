class Team < ActiveRecord::Base
  validates :team_type, presence: true
  has_many users
  
  def self.create_for(team_type)
    users = User.all.to_a
    
    return nil if users.empty?
    
    
  end
end
