class Item < ApplicationRecord
  belongs_to :shop
  with_options presence: true do
    validates :name
    validates :price
    validates :stock
    validates :comment
  end
end
