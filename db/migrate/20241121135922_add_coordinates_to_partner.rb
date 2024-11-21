class AddCoordinatesToPartner < ActiveRecord::Migration[7.1]
  def change
    add_column :partners, :latitude, :float
    add_column :partners, :longitude, :float
  end
end
