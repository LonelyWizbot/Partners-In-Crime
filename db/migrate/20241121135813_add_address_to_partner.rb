class AddAddressToPartner < ActiveRecord::Migration[7.1]
  def change
    add_column :partners, :address, :string
  end
end
