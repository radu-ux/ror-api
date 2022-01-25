require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "user with a valid email should be valid" do
    user = User.new(email: "test@test.com", password_digest: "hashed_passwprd")
    assert user.valid?
  end

  test "user with an invalid email should be invalid" do 
    user = User.new(email: "test", password_digest: "hashed_password")
    assert_not user.valid?
  end

  test "user with taken email should be invalid" do 
    user = User.new(email: "one@one.org", password_digest: "hashed_password")
    assert_not user.valid?
  end

end
