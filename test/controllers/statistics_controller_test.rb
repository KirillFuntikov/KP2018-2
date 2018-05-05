require 'test_helper'

class StatisticsControllerTest < ActionDispatch::IntegrationTest
  test "should get generate_scv_user" do
    get statistics_generate_scv_url
    assert_response :success
  end

end
