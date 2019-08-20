class Basket < ApplicationRecord
  belongs_to :user
  has_many :basket_items

  def empty?
    basket_items.empty?
  end

  def empty!
    basket_items.destroy_all
  end
end
