class CreateProductVariants < ActiveRecord::Migration[5.2]
  def change
    create_table :product_variants do |t|
      t.string :SKU
      t.string :price
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
