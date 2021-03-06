require 'test_helper'

class SignUpTest < ActionDispatch::IntegrationTest


  test "should sign up new user" do
    get signup_path
    assert_template 'users/new'
    assert_difference 'User.count', 1 do
      post users_path, params:{user:{username: "Yasir11", email: "yasir11@gmail.com", password: "password" }}
      follow_redirect!
    end
    assert_template 'users/show'
    assert_match 'Yasir11', response.body
  end
  
end
