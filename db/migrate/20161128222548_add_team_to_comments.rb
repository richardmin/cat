class AddTeamToComments < ActiveRecord::Migration
  def self.up
    add_column :comments, :team, :integer
  end
end
