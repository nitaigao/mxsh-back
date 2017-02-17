require 'test_helper'

class IdentitiesControllerTest < ActionDispatch::IntegrationTest
  test "shows all identities" do
    auth_as(:user)
    
    get '/api/identities'
    assert_response :success
  end

  test "cant show identities without a user" do
    get '/api/identities'
    assert_response :unauthorized
  end

  test "creates as identity" do
    auth_as(:user)
    
    post '/api/identities'
    assert_response :success

    new_identity = JSON.parse(response.body).symbolize_keys
    assert new_identity[:email] != nil
    assert new_identity[:received] == 0
  end

  test "cant create an identity without a user" do
    post '/api/identities'
    assert_response :unauthorized
  end
end
