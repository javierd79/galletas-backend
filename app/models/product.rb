class Product < ApplicationRecord
  has_many :products_carritos, dependent: :destroy
  has_many :carritos, through: :products_carritos

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :description, presence: true
end
