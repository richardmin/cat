class AddTeamToComments < ActiveRecord::Migration
  def self.up
    add_column :comments, :team_id, :integer
  end
end
