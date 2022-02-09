class AddUserToIngredient < ActiveRecord::Migration[7.0]
  def change
    add_reference :ingredients, :user, index: true
  end
end
