require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(uid: "ExampleUser", google_access_token: "fdfdfdfdfdfdse", id_token: "dsfffsdfsdfsfs")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "google_access_token should be present" do
    @user.google_access_token = ""
    assert_not @user.valid?
  end

  test "id_token should be present" do
    @user.id_token = ""
    assert_not @user.valid?
  end

  test "uid addresses shuold be unique" do #同じuidが保存されないか確認
    duplicate_user = @user.dup
    duplicate_user.uid = @user.uid #大文字と小文字は区別する
    @user.save
    assert_not duplicate_user.valid?
  end

end
