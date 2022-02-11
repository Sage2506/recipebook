# frozen_string_literal: true

class Ingredient < ApplicationRecord
  scope :active, -> { where(status: "active") }
  has_many :dish_ingredients
  has_many :dishes, through: :dish_ingredients
  enum status: { active: 0, disabled: 1 }
  belongs_to :user
  validates :name, presence: true
end
