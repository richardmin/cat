class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.integer :team_type

      t.timestamps null: false
    end
  end
end
