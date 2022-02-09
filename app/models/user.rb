# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  enum role: { admin: 0, moderator: 1, volunteer: 2 }
  has_many :ingredients
  has_many :dishes

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  alias_method is_admin?, admin?
  alias_method is_moderator?, moderator?
  alias_method is_volunteer?, volunteer?
end
