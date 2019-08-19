class CreateBasketItems < ActiveRecord::Migration[5.2]
  def change
    create_table :basket_items do |t|
      t.string :quantity
      t.references :basket, foreign_key: true
      t.references :product_variant, foreign_key: true

      t.timestamps
    end
  end
end
