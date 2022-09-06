class Carrito < ApplicationRecord
  belongs_to :user

  has_many :products_carritos, dependent: :destroy
  has_many :products, through: :products_carritos
end
