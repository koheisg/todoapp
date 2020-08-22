require 'test_helper'

class Tasks::CompletedControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tasks_completed_index_url
    assert_response :success
  end

end
