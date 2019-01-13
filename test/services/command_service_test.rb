
require 'test_helper'

class CommandServiceTest < ActiveSupport::TestCase
  test "returns uknown command!" do
    assert_equal CommandService.process('random thingy', 'user_id', 'user_name', 'team_id'), "Unknown command!"
  end

  test "creates team" do
    assert_difference('Team.count', 1) do
      response = CommandService.process('join', 'user_id', 'user_name', 'team_id')
      assert_equal response, "Awesome! You are setup for desk-sawp! wait for our message to setup your first 🖥 🔄"
    end
  end

  test "creates user" do
    assert_difference('User.count', 1) do
      response = CommandService.process('join', 'user_id', 'user_name', 'team_id')
      assert_equal response, "Awesome! You are setup for desk-sawp! wait for our message to setup your first 🖥 🔄"
    end
  end
end
