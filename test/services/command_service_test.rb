
require 'test_helper'

class CommandServiceTest < ActiveSupport::TestCase
  test "returns uknown command!" do
    assert_equal CommandService.process("random thingy", 'user_id', 'user_name', 'team_id'), "Unknown command!"
  end
end
