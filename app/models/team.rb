class Team < ActiveRecord::Base
  validates :team_type, presence: true
  has_many users
end
