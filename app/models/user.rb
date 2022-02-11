# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  scope :active, -> { where(deactivated: false) }
  enum role: { admin: 0, moderator: 1, volunteer: 2 }
  has_many :ingredients
  has_many :dishes

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def active_for_authentication?
    super && !deactivated
  end

  def destroy
    update(deactivated: true) unless deactivated
  end
end
