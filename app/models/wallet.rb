class Wallet < ApplicationRecord
  belongs_to :user
  # validates :money, presence: true, numericality: { only_integer: true }
end
