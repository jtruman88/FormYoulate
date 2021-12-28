require "test_helper"

class FormsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:john)
  end

  test 'logged in user can see forms index page' do
    log_in_as(@user)
    get forms_path
    assert_response :success
  end

  test 'non-logged in user is redirected to sign in when visting forms index page' do
    get forms_path
    assert_redirected_to signin_path
  end
end
