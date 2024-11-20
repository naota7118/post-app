require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest

  def setup
    # test/fixtures/users.ymlから取得
    @user = users(:tanaka)
  end

  test "should get new" do
    get login_path
    assert_response :success
  end

  test "login with valid information" do
    post login_path, params: { session: { email: @user.email, password: 'password' } }
    # レスポンスがリダイレクトかチェック
    assert_response :redirect
    # リダイレクト先が正しいかチェック
    assert_redirected_to root_path
    # 実際にリダイレクトする
    follow_redirect!
    assert_template 'microposts/index'
    assert_select "a[href=?]", logout_path
    assert_select "a", "ログイン中ユーザー：#{@user.name}"
  end

end
