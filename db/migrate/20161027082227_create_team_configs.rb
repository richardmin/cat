class CreateTeamConfigs < ActiveRecord::Migration
  def change
    create_table :team_configs do |t|
      t.string :description
      t.integer :num_support
      t.integer :num_tank
      t.integer :num_DPS

      t.timestamps null: false
    end
  end
end
