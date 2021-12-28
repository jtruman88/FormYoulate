require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    user_attrs = {
      username: 'TestUser',
      password: 'password',
      password_confirmation: 'password'
    }
    @user = User.new(user_attrs)
  end

  test 'user should be valid' do
    assert @user.valid?
  end

  test 'username should be present' do
    @user.username = ' '
    assert_not @user.valid?
  end

  test 'usernames should be unique' do
    other_user = @user.dup
    @user.save
    assert_not other_user.valid?
  end

  test 'password should be present' do
    @user.password = ' '
    assert_not @user.valid?
  end

  test 'password confirmation should match password' do
    @user.password_confirmation = 'different'
    assert_not @user.valid?
  end

  test 'password should be at least 6 characters' do
    @user.password = 'close'
    assert_not @user.valid?
  end

  test 'owns_form? should return true if user created the form' do
    john = users(:john)
    johns_form = forms(:john_form)
    assert john.owns_form?(johns_form)
  end

  test 'owns_form? should return false if user did not create the form' do
    jane = users(:jane)
    johns_form = forms(:john_form)
    assert_not jane.owns_form?(johns_form)
  end
end
