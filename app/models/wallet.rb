class Wallet < ApplicationRecord
  belongs_to :user
  has_many :money, dependent: :destroy
end
