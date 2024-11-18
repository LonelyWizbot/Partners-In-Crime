class AddAdditionalAddressToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :additional_address, :string
  end
end
