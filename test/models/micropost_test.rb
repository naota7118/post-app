require "test_helper"

class MicropostTest < ActiveSupport::TestCase

  def setup
    @user = users(:tanaka)
    @micropost = @user.microposts.build(content: 'hello', user_id: @user.id)
  end

  test "should be valid" do
    assert @micropost.valid?
  end

  test "should not be valid" do
    @micropost.user_id = nil
    assert_not @micropost.valid?
  end

  test "post without content can be valid" do
    @micropost.content = nil
    assert @micropost.valid?
  end
end
