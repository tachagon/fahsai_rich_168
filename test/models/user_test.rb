require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(
      id: 9999,
      email: "o_k_t@hotmail.com",
      password: "password",
      iden_number: "1102001936122",
      first_name: "Tatchagon",
      last_name: "Koonkoei",
      address: "111/1 ม.3",
      district: districts(:banmai),
      amphur: amphurs(:thamuang),
      province: provinces(:kanchanaburi),
      zipcode: zipcodes(:zipcode_71110),
      phone_number: "0826810461",
      line_id: "tachagon",
      birthday: "06/02/1993",
      gender: "male"
    )
  end

  test "user should be valid" do
    assert @user.valid?
  end

  # ===================================================
  # member_code test
  # ===================================================

  test "member_code should be present" do
    @user.save
    assert @user.valid?
    assert_not_equal @user.reload.member_code, ""
  end

  test "member_code should be auto generate" do
    @user.save
    @user.reload
    assert_equal @user.member_code, sprintf("%06d", 1000 + @user.id)
  end

  # ===================================================
  # iden_number test
  # ===================================================

  test "iden_number should be present" do
    @user.iden_number = "     "
    assert_not @user.valid?
  end

  test "iden_number length should be 13" do
    @user.iden_number = "0" * 14
    assert_not @user.valid?

    @user.iden_number = "1" * 12
    assert_not @user.valid?
  end

  test "iden_number should accept valid" do
    iden_number_valid = [
      "7622803603308",
      "6245681003229",
      "3634724302631",
      "6414858655852",
      "4708582144250",
      "1326470440539",
      "8234355220706",
      "1103132458829",
      "1823877225226",
      "3071525878250"
    ]
    iden_number_valid.each do |iden_number|
      @user.iden_number = iden_number
      assert @user.valid?
    end
  end

  test "iden_number should reject invalid" do
    iden_number_invalid = [
      "7622803603309",
      "6245681003220",
      "3634724302632",
      "6414858655853",
      "4708582144251",
      "1326470440530",
      "8234355220707",
      "1103132458828",
      "1823877225227",
      "3071525878251"
    ]
    iden_number_invalid.each do |iden_number|
      @user.iden_number = iden_number
      assert_not @user.valid?
    end
  end

  test "iden_number should be unique" do
    duplicate_user = @user.dup
    duplicate_user.iden_number = @user.iden_number
    @user.save
    assert_not duplicate_user.valid?
  end

  # ===================================================
  # first_name test
  # ===================================================

  test "first_name should be not too long" do
    @user.first_name = "a" * 101
    assert_not @user.valid?
  end

  test "first_name should be present" do
    @user.first_name = ""
    assert_not @user.valid?
  end

  # ===================================================
  # last_name test
  # ===================================================

  test "last_name should be not too long" do
    @user.last_name = "a" * 101
    assert_not @user.valid?
  end

  test "last_name should be present" do
    @user.last_name = ""
    assert_not @user.valid?
  end

  # ===================================================
  # address test
  # ===================================================

  test "address should be not too long" do
    @user.address = "a" * 256
    assert_not @user.valid?
  end

  test "address should be present" do
    @user.address = ""
    assert_not @user.valid?
  end

  # ===================================================
  # district test
  # ===================================================

  test "district should be present" do
    @user.district = nil
    assert_not @user.valid?
  end

  # ===================================================
  # amphur test
  # ===================================================

  test "amphur should be present" do
    @user.amphur = nil
    assert_not @user.valid?
  end

  # ===================================================
  # province test
  # ===================================================

  test "province should be present" do
    @user.province = nil
    assert_not @user.valid?
  end

  # ===================================================
  # zipcode test
  # ===================================================

  test "zipcode should be present" do
    @user.zipcode = nil
    assert_not @user.valid?
  end

  # ===================================================
  # phone_number test
  # ===================================================

  test "phone_number should be format" do
    @user.phone_number = "1826810461"
    assert_not @user.valid?

    @user.phone_number = "082a810461"
    assert_not @user.valid?

    @user.phone_number = "082-6810461"
    assert_not @user.valid?

    @user.phone_number = "0826810461"
    assert @user.valid?

    @user.phone_number = "034658471"
    assert @user.valid?
  end

  test "phone_number length should be 9 to 10" do
    @user.phone_number = "0" * 8
    assert_not @user.valid?

    @user.phone_number = "0" * 11
    assert_not @user.valid?
  end

  test "phone_number should be present" do
    @user.phone_number = "     "
    assert_not @user.valid?
  end

  # ===================================================
  # line_id test
  # ===================================================

  # ===================================================
  # role test
  # ===================================================

  test "role should be present" do
    @user.role = nil
    assert_not @user.valid?
  end

  test "default role should be member" do
    @user.save
    @user.reload
    assert_equal @user.role, Role.member
  end

  # ===================================================
  # birthday test
  # ===================================================

  test "birthday should be present" do
    @user.birthday = "     "
    assert_not @user.valid?
  end

  # ===================================================
  # gender test
  # ===================================================

  test "gender should be male or female" do
    @user.gender = "male"
    assert @user.valid?

    @user.gender = "female"
    assert @user.valid?

    @user.gender = "anything"
    assert_not @user.valid?
  end

  test "gender should be present" do
    @user.gender = "     "
    assert_not @user.valid?
  end

end
