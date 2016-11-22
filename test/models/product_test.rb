require 'test_helper'

class ProductTest < ActiveSupport::TestCase
   def setup
      @product = Product.new(
         :name => "name1",
         :description => "description",
         :price => 10,
         :pv => 0,
         :quantity => 0,
         :unit => "112")
   end
  
   test "Default Object should valid" do
     assert @product.valid?
   end
   
   # ==========================================================
   # test amount name
   # ==========================================================
   
   test "name should exists" do
      @product.name = nil
      assert_not @product.valid?
   end
   
   test "name should be unique" do
      @product.save
      print @product.name
      @product2 = Product.new(
         :name => "name1",
         :description => "description",
         :price => 10,
         :pv => 0,
         :quantity => 0,
         :unit => "112")

      assert_not @product2.valid?
   end
   
   # ==========================================================
   # test amount price
   # ==========================================================
   
   test "price should be exists" do
      @product.price = nil
      assert_not @product.valid?
   end
   
   test "price should be number" do
      @product.price = "text"
      assert_not @product.valid?
   end
   
   # ==========================================================
   # test amount pv
   # ==========================================================
   
   test "pv should be exists" do
      @product.pv = nil
      assert_not @product.valid?
   end
   
   test "pv should unique" do
      @product.pv = "text"
      assert_not @product.valid?
   end
   
   # ==========================================================
   # test amount quantity
   # ==========================================================
   
   test "quantity should be exists" do
      @product.price = nil
      assert_not @product.valid?
   end

   test "quantity should be integer more than zero" do
      @product.quantity = "text"
      assert_not @product.valid?
      @product.quantity = -0.5
      assert_not @product.valid?
      @product.quantity = 0.5
      assert_not @product.valid?
   end
   
   # ==========================================================
   # test amount unit
   # ==========================================================
   
   test "unit should be exists" do
      @product.price = nil
      assert_not @product.valid?
   end
end
