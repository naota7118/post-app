require "test_helper"

class UserEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:tanaka)
  end

  test "unsuccessful edit" do
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { name:  "",
                                              email: "foo@invalid",
                                              password:              "foo",
                                              password_confirmation: "bar" } }
    assert_template 'users/edit'
  end

  test "successful edit" do
    # セッション用のページを表示する
    get login_path
    # セッション用のフォームからログインする
    post login_path, params: { session: { email: @user.email, password: "password"} }
    # ログイン情報を変数に格納する
    get edit_user_path(@user)
    assert_template 'users/edit'
    name = 'Foo Bar'
    email = 'foo@bar.com'
    patch user_path(@user), params: { user: { name:  name,
                                              email: email,
                                              password:              "",
                                              password_confirmation: "" } }
    assert_redirected_to @user
    @user.reload
    assert_equal name, @user.name
    assert_equal email, @user.email
  end
end
