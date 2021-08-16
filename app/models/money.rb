class Money < ApplicationRecord
  belongs_to :wallet
  validates :money, presence: true, numericality: { only_integer: true }
end
