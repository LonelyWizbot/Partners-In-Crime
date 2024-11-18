class AddZipCodeToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :zip_code, :integer
  end
end
