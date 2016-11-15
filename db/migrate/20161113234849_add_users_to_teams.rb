class AddUsersToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :user1, :integer
    add_column :teams, :user2, :integer
    add_column :teams, :user3, :integer
    add_column :teams, :user4, :integer
    add_column :teams, :user5, :integer
    add_column :teams, :user6, :integer

  end
end
