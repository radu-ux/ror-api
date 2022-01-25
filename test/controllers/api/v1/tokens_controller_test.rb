require "test_helper"

class Api::V1::TokensControllerTest < ActionDispatch::IntegrationTest
  def setup 
    @user = users(:two)
  end
  
  test "the JWT token should be created" do 
    post api_v1_tokens_url, params: {user: {email: @user.email, password: "password_of_two"}}, as: :json
    assert_response :success

    json_response = JSON.parse(self.response.body)
    assert_not_nil json_response["token"]
  end

  test "the JWT token should not be created" do 
    post api_v1_tokens_url, params: {user: {email: @user.email, password: "bad_password"}}, as: :json
    assert_response :unauthorized
  end
end
