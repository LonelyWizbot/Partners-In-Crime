class CreatePartners < ActiveRecord::Migration[7.1]
  def change
    create_table :partners do |t|
      t.string :title
      t.text :description
      t.string :image
      t.integer :status
      t.float :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
