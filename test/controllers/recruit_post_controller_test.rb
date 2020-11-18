require 'test_helper'

class RecruitPostControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get recruit_post_new_url
    assert_response :success
  end

end
