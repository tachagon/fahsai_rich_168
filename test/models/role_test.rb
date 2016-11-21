require 'test_helper'

class RoleTest < ActiveSupport::TestCase
  def setup
    @role = Role.new( :name => "bob", :level => 3 )
  end

  # ==========================================================
  # test amount name
  # ==========================================================

  test "name should be exists" do
    @role.name = nil
    assert_not @role.valid?
  end

  # ==========================================================
  # test amount level
  # ==========================================================

  test "level should more than 0" do
    @role.level = "text"
    assert_not @role.valid?
    @role.level = -5
    assert_not @role.valid?
    @role.level = 0.5
    assert_not @role.valid?
  end

  test "level should be exists" do
    @role.level = nil
    assert_not @role.valid?
  end

  test "level should be integer" do
    @role.level = "text"
    assert_not @role.valid?
  end

  # ==========================================================
  # test public function
  # ==========================================================

  test "admin function should return admin object" do
    admin_role = Role.admin
    assert_equal(admin_role.name, "admin")
    assert_equal(admin_role.level, 1)
  end

  test "employee function should return employee object" do
    employee_role = Role.employee
    assert_equal(employee_role.name, "employee")
    assert_equal(employee_role.level, 2)
  end

  test "wholesaler function should return wholesaler object" do
    wholesaler_role = Role.wholesaler
    assert_equal(wholesaler_role.name, "wholesaler")
    assert_equal(wholesaler_role.level, 3)
  end

  test "mobile function should return mobile object" do
    mobile_role = Role.mobile
    assert_equal(mobile_role.name, "mobile")
    assert_equal(mobile_role.level, 4)
  end

  test "member function should return member object" do
    member_role = Role.member
    assert_equal(member_role.name, "member")
    assert_equal(member_role.level, 5)
  end

end
