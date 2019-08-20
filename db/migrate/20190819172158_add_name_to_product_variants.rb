class AddNameToProductVariants < ActiveRecord::Migration[5.2]
  def change
    add_column :product_variants, :name, :string
  end
end
