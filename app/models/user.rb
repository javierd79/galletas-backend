class User < ApplicationRecord
  has_secure_password

  has_one :carrito, dependent: :destroy

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: VALID_EMAIL_REGEX }

  validates :name, presence: true
  validates :lastname, presence: true

  validates :direction, presence: true
  
  validates :cedula, presence: true, uniqueness: true

  validates_length_of :cedula, is: 9 # V29543140

  validates_length_of :phone, minimum:11, maximum:14, allow_blank: false

  validates :password, 
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }
end
