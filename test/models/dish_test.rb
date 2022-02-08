# frozen_string_literal: true

require "test_helper"

class DishTest < ActiveSupport::TestCase
  def dish
    dishes(:one)
  end
  test 'fixture must be valid' do
    assert dish.valid?
  end

  test 'wont be valid if description is missing' do
    assert_not dishes(:invalid).valid?
  end

  test 'must not save without name' do
    dish = Dish.new(description: 'dish description')
    assert_not dish.valid?
  end
end
