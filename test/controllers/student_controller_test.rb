require 'test_helper'

class StudentControllerTest < ActionDispatch::IntegrationTest
  test "should get createform" do
    get student_createform_url
    assert_response :success
  end

end
