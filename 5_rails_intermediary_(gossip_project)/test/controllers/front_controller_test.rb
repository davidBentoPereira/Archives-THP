require 'test_helper'

class FrontControllerTest < ActionDispatch::IntegrationTest
  test "should get team" do
    get front_team_url
    assert_response :success
  end

  test "should get contact" do
    get front_contact_url
    assert_response :success
  end

end
