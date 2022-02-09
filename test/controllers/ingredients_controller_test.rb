# frozen_string_literal: true

require "test_helper"

class IngredientsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @ingredient = ingredients(:salt)
    sign_in users(:one)
  end

  test "must get index" do
    get ingredients_url
    assert_response :success
  end

  test "must get new" do
    get new_ingredient_url
    assert_response :success
  end

  test "must create ingredient" do
    assert_difference("Ingredient.count") do
      post ingredients_url, params: { ingredient: { description: @ingredient.description, name: @ingredient.name } }
    end

    assert_redirected_to ingredient_url(Ingredient.last)
  end

  test "must show ingredient" do
    get ingredient_url(@ingredient)
    assert_response :success
  end

  test "must get edit" do
    get edit_ingredient_url(@ingredient)
    assert_response :success
  end

  test "must update ingredient" do
    patch ingredient_url(@ingredient),
          params: { ingredient: { description: @ingredient.description, name: @ingredient.name } }
    assert_redirected_to ingredient_url(@ingredient)
  end

  test "must destroy ingredient" do
    assert_difference("Ingredient.active.count", -1) do
      delete ingredient_url(@ingredient)
    end

    assert_redirected_to ingredients_url
  end
end
