# frozen_string_literal: true

require "test_helper"

class DishTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save without name or description" do
    dish = Dish.new
    assert_not dish.save, "Saved the dish without a name and description"
  end

  test "should not save without name" do
    dish = Dish.new(description: "dish description")
    assert_not dish.save, "Saved the dish without a name"
  end

  test "should not save without description" do
    dish = Dish.new(name: "dish name")
    assert_not dish.save, "Saved the dish without a description"
  end
end
