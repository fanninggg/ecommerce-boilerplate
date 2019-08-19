class ProductVariant < ApplicationRecord
  belongs_to :product
  has_many :basket_items, dependent: :destroy
  has_many :order_items, dependent: :destroy
end
