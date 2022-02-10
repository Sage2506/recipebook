# frozen_string_literal: true

class Ingredient < ApplicationRecord
  scope :active, -> { where(status: "active") }
  has_many :dish_ingredients
  has_many :dishes, through: :dish_ingredients
  belongs_to :user
  validates :name, presence: true
  def is_active?
    status == "active"
  end
end
