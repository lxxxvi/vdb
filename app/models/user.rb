class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, :rememberable, and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :validatable

  has_many :releases, dependent: :destroy
end
