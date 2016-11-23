require 'test_helper'

class PositionTest < ActiveSupport::TestCase
   def setup
      @position = Position.new(
         :name => "nam3e1",
         :benefit_layer => 10,
         :min_pv => 0.0)
   end

   test "Default Object should valid" do
     assert @position.valid?
   end

   # ==========================================================
   # test amount name
   # ==========================================================

   test "name should exists" do
      @position.name = nil
      assert_not @position.valid?
   end

   # ==========================================================
   # test amount benefit_layer
   # ==========================================================

   test "benefit_layer should be exists" do
      @position.benefit_layer = nil
      assert_not @position.valid?
   end

   test "benefit_layer should be number" do
      @position.benefit_layer = "text"
      assert_not @position.valid?
      @position.benefit_layer = -0.5
      assert_not @position.valid?
      @position.benefit_layer = 0.5
      assert_not @position.valid?
   end

   # ==========================================================
   # test amount min_pv
   # ==========================================================

   test "min_pv should be exists" do
      @position.min_pv = nil
      assert_not @position.valid?
   end

   test "min_pv should unique" do
      @position.min_pv = "text"
      assert_not @position.valid?
      @position.min_pv = -0.5
      assert_not @position.valid?
   end
end
