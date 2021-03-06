# frozen_string_literal: true

class Dish < ApplicationRecord
  belongs_to :user
  has_many :dish_ingredients, dependent: :destroy
  has_many :ingredients, through: :dish_ingredients
  has_one_attached :image

  validates :name, presence: true

  def save_ingredients(ingredients)
    result = true
    DishIngredient.transaction do
      ingredients.each do |ingredient|
        logger.info "@----------------------------------------------------- Dish id: #{id} "
        new_dish_ingredient = DishIngredient.new(
          dish_id: id,
          ingredient_id: ingredient
        )
        unless new_dish_ingredient.save
          result = false
          raise ActiveRecord::Rollback, "Dish Ingredient not saved"
        end
      end
    end
    result
  end
end
