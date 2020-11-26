require 'test_helper'

class CompanyControllerTest < ActionDispatch::IntegrationTest
  test "should get create_form" do
    get company_create_form_url
    assert_response :success
  end

end
