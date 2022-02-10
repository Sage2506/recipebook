# frozen_string_literal: true

require "test_helper"

class DishesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  Rails::Controller::Testing.install

  setup do
    @dish = dishes(:one)
    sign_in users(:one)
  end

  test "must get index" do
    get dishes_url
    assert_response :success
  end

  test "must get new" do
    get new_dish_url
    assert_response :success
  end

  test "must create dish" do
    salt = Ingredient.find_by(name: "salt")
    sugar = Ingredient.find_by(name: "sugar")
    assert_difference("Dish.count") do
      post dishes_url,
           params: { dish: { description: @dish.description, name: @dish.name,
                             ingredients: [sugar.id.to_s, salt.id.to_s] } }
    end

    assert_redirected_to dish_url(Dish.last)
    assert_not_nil Dish.find_by(name: @dish.name)
    assert_equal 2, Dish.last.ingredients.size
    assert_not_nil Dish.last.user_id
  end

  test "must show dish" do
    get dish_url(@dish)
    assert_response :success
  end

  test "must get edit" do
    get edit_dish_url(@dish)
    assert_response :success
  end

  test "should update dish" do
    salt = Ingredient.find_by(name: "salt")
    sugar = Ingredient.find_by(name: "sugar")
    garlic = Ingredient.find_by(name: "ajo")
    put dish_url(@dish),
        params: { dish: { description: @dish.description, name: @dish.name,
                          ingredients: [sugar.id, salt.id, garlic.id] } }
    assert_redirected_to dish_url(@dish)
    assert_equal 3, @dish.ingredients.size
  end

  test "must destroy dish" do
    assert_difference("Dish.count", -1) do
      delete dish_url(@dish)
    end

    assert_redirected_to dishes_url
  end

  test "must match search" do
    get dishes_url, params: { q: "cere" }
    dishes = assigns(:dishes)
    assert_not_nil dishes
    assert_equal 1, dishes.size
    dish = dishes[0]
    assert_match(/cere/, dish.name.downcase)
    assert_response :success
  end
end
