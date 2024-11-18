class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.date :start_date
      t.date :end_date
      t.text :message
      t.float :total_price
      t.integer :status, default: 0
      t.references :user, null: false, foreign_key: true
      t.references :partner, null: false, foreign_key: true

      t.timestamps
    end
  end
end
