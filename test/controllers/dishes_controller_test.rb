# frozen_string_literal: true

require 'test_helper'

class DishesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @dish = dishes(:cereal)
    sign_in users(:hotmail)
  end

  test 'should get index' do
    get dishes_url
    assert_response :success
  end

  test 'should get new' do
    get new_dish_url
    assert_response :success
  end

  test 'should create dish' do
    salt = Ingredient.find_by(name:"salt")
    sugar = Ingredient.find_by(name:"sugar")
    assert_difference('Dish.count') do
      post dishes_url, params: { dish: { description: @dish.description, name: @dish.name, ingredients: [sugar.id.to_s, salt.id.to_s] } }
    end

    assert_redirected_to dish_url(Dish.last)
    assert_equal 2, Dish.last.ingredients.size
    assert_not_nil Dish.last.user_id
  end

  test 'should show dish' do
    get dish_url(@dish)
    assert_response :success
  end

  test 'should get edit' do
    get edit_dish_url(@dish)
    assert_response :success
  end

  test 'should update dish' do
    salt = Ingredient.find_by(name:"salt")
    sugar = Ingredient.find_by(name:"sugar")
    garlic = Ingredient.find_by(name:"ajo")
    patch dish_url(@dish), params: { dish: { description: @dish.description, name: @dish.name, ingredients: [salt.id.to_s, sugar.id.to_s, garlic.id.to_s] } }
    assert_redirected_to dish_url(@dish)
    assert_equal 3, @dish.ingredients.size
  end

  test 'should destroy dish' do
    assert_difference('Dish.count', -1) do
      delete dish_url(@dish)
    end

    assert_redirected_to dishes_url
  end
end
