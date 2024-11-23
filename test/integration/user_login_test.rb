require "test_helper"

class UserLoginTest < ActionDispatch::IntegrationTest

  def setup
    # test/fixtures/users.ymlから取得
    @user = users(:tanaka)
  end

  test "login with valid information" do
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password' } }
    assert_redirected_to root_path
    follow_redirect!
    assert_template 'microposts/index'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    # assert_select "a[href=?]", user_path(@user)
  end

  test "login with invalid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: '', password: '' }}
    assert_response :unprocessable_entity
    assert_template 'sessions/new'
  end

  test "login with valid email/invalid password" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: @user.email, password: "invalid" }}
    assert_response :unprocessable_entity
    assert_template 'sessions/new'
    assert flash
    get root_path
    assert flash.empty? # flash.empty?=true=フラッシュが空 ならばテストがパスする 望ましい挙動 → 現状falseになる
  end

  # test "login with valid information" do
  #   post login_path, params: { session: { email: @user.email, password: 'password' } }
  #   # レスポンスがリダイレクトかチェック
  #   assert_response :redirect
  #   # リダイレクト先が正しいかチェック
  #   assert_redirected_to root_path
  #   # 実際にリダイレクトする
  #   follow_redirect!
  #   assert_template 'microposts/index'
  #   assert_select "a[href=?]", logout_path
  #   assert_select "a", "ログイン中ユーザー：#{@user.name}"
  # end

end
