require 'test_helper'

class CreateNewArticleTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create(username: "Yasir11", email: "yasir11@gmail.com", password: "password")
  end

  test "should create new article" do
    sign_in_as(@user, "password")
    get new_article_path
    assert_template 'articles/new'
    assert_difference 'Article.count', 1 do
      post articles_path, params: { article: {title: "This is testing title", description: "This is the description of it", category: "sports"} }
      follow_redirect!
    end
  end
end

  

  
