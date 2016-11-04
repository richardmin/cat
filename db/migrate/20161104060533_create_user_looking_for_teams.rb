class CreateUserLookingForTeams < ActiveRecord::Migration
  def change
    create_table :user_looking_for_teams do |t|
      t.string :role
      t.datetime :time_queue_started
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
