# frozen_string_literal: true

require "test_helper"

class IngredientTest < ActiveSupport::TestCase
  def ingredient
    ingredients(:onion)
  end

  test "fixture must be valid" do
    assert ingredient.valid?
  end
end
