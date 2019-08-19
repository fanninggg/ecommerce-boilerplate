class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :name
      t.string :line1
      t.string :line2
      t.string :postcode
      t.string :city
      t.string :county
      t.string :country
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
