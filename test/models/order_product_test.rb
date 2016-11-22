require 'test_helper'

class OrderProductTest < ActiveSupport::TestCase
  def setup
    @banmai = districts(:banmai)
    @thamuang = amphurs(:thamuang)
    @kanchanaburi = provinces(:kanchanaburi)
    @thamuang_zip = zipcodes(:thamuang_zip)
    @user = 	User.new(
  		email: "o_k_t@hotmail.com",
  		password: "password",
  		iden_number: "1102001936122",
  		first_name: "Tatchagon",
  		last_name: "Koonkoei",
  		address: "111/1 ม.3",
  		district: @banmai,
  		amphur: @thamuang,
  		province: @kanchanaburi,
  		zipcode: @thamuang_zip,
  		phone_number: "0826810461",
  		line_id: "tachagon",
  		birthday: "06/02/1993",
  		gender: "male"
		)
    @user.save!
    @user.save!
    @order = @user.order.create!(
      :purchaser_id => "cat",
      :saler_id => "dog"
    )
    
    @product = Product.new(
         :name => "fish",
         :description => "food",
         :price => 1000000,
         :pv => 0,
         :quantity => 2,
         :unit => "112")
    
    @orderproduct =  @order.order_product.new(
      product: @product,
      :quantity => 0)
  end
  
  # ==========================================================
  # test association
  # ==========================================================
  
  test "orderproduct.product should equal to product" do
      assert @orderproduct.product.name == @product.name
  end
  
  test "orderproduct.order should equal to order" do
      assert @orderproduct.order.purchaser_id == @order.purchaser_id
  end
  
  test "product should be exists" do
    @orderproduct.product = nil
    assert_not @orderproduct.valid?
  end
  
  test "order should be exists" do
    @orderproduct.order = nil
    assert_not @orderproduct.valid?
  end
  
  # ==========================================================
  # test amount quantity
  # ==========================================================
  
  test "quantity should be integer more than zero" do
      @orderproduct.quantity = "text"
      assert_not @orderproduct.valid?
      @orderproduct.quantity = -5
      assert_not @orderproduct.valid?
      @orderproduct.quantity = 0.5
      assert_not @orderproduct.valid?
      @orderproduct.quantity = 5
      assert @orderproduct.valid?
   end
  
  # ==========================================================
  # test amount total_price
  # ==========================================================
  
  test "total_price should be 0" do
    assert @orderproduct.total_price == 0
  end
  
  test "total_price should be exists" do
    @orderproduct.total_price = nil
    assert_not @orderproduct.valid?
  end
  
  test "total_price should be integer" do
    @orderproduct.total_price = "text"
    assert_not @orderproduct.valid?
  end
  
  # ==========================================================
  # test amount total_pv
  # ==========================================================
  
  test "total_pv should be 0" do
    assert @orderproduct.total_pv == 0
  end
  
  test "total_pv should be exists" do
    @orderproduct.total_pv = nil
    assert_not @orderproduct.valid?
  end
  
  test "total_pv should be integer" do
    @orderproduct.total_pv = "text"
    assert_not @orderproduct.valid?
  end
end
