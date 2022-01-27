# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  enum role: %i[admin moderator volunteer]
  has_many :ingredients
  has_many :dishes

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
