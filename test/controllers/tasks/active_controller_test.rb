require 'test_helper'

class Tasks::ActiveControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tasks_active_index_url
    assert_response :success
  end

end
