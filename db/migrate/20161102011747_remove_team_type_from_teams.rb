class RemoveTeamTypeFromTeams < ActiveRecord::Migration
  def change
    remove_column :teams, :team_type, :integer
  end
end
