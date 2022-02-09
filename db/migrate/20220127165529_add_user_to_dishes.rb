class AddUserToDishes < ActiveRecord::Migration[7.0]
  def change
    add_reference :dishes, :user, index: true
  end
end
