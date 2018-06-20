class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :messages

  has_one_attached :avatar

  serialize :following, Array

  def full_name
    "#{first_name} #{last_name}"
  end
end
