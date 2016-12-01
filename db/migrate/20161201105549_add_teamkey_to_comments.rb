class AddTeamkeyToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :teams, index: true
  end
end
