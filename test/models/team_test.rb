require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  def setup
    @team = Team.new(team_type: 0)
  end
  
  test "should be valid" do
    assert @team.valid?
  end
  
  test "team type should be present" do
    @team.team_type = nil
    assert_not @team.valid?
  end
end
