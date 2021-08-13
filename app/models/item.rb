class Item < ApplicationRecord
  belongs_to :shop
  has_many :cart_items, dependent: :destroy

  with_options presence: true do
    validates :name
    validates :price
    validates :stock
    validates :comment
  end
end
