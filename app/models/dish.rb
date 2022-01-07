class Dish < ApplicationRecord
    validates :name, presence: true
    validates :description, presence: true

    has_many :dish_ingredients, dependent: :destroy
    has_many :ingredients, through: :dish_ingredients

    def save_ingredients(ingredients)
        result = true
        DishIngredient.transaction do
          ingredients.each do |ingredient|
            new_dish_ingredient = DishIngredient.new(
              dish_id: self.id,
              ingredient_id: ingredient,
            )
            if !new_dish_ingredient.save
              result = false
              raise ActiveRecord::Rollback, "Dish Ingredient not saved"
            end
          end
        end
        return result
      end
end
