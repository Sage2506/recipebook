# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  enum role: { admin: 0, moderator: 1, volunteer: 2 }
  has_many :ingredients
  has_many :dishes

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def is_admin?
    role == "admin"
  end

  def is_moderator?
    role == "moderator"
  end

  def is_volunteer?
    role == "volunteer"
  end
end
