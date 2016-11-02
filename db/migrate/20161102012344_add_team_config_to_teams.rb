class AddTeamConfigToTeams < ActiveRecord::Migration
  def change
    add_reference :teams, :team_config, index: true, foreign_key: true
  end
end
