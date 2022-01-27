class AddStatusToIngredient < ActiveRecord::Migration[7.0]
  def change
    add_column :ingredients, :status, :string, default: "active"
  end
end
