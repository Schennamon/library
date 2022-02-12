require "test_helper"

class AdminTest < ActiveSupport::TestCase
  def setup
    @admin = Admin.new("name"=>"admin1", "password"=>"1234")
  end

  test "admin should be valid" do
    assert @admin.valid?
  end

  test "name should be present" do
    @admin.name = ""
    assert_not @admin.valid?
  end

  test "name should be unique" do
    @admin.save
    @admin2 = Admin.new(name: "admin1")
    assert_not @admin2.valid?
  end

  test "name should not be too long" do
    @admin.name = "a" * 26
    assert_not @admin.valid?
  end

  test "name should not be too short" do
    @admin.name = "a"
    assert_not @admin.valid?
  end

  test "password should be equal password_digest in db" do
    @admin.save
    @admin = Admin.find_by(name: "admin1")
    assert @admin.authenticate("1234")
  end

  test "password should not be equal password_digest in db" do
    @admin.save
    @admin = Admin.find_by(name: "admin1")
    assert_not @admin.authenticate("1")
  end
end
