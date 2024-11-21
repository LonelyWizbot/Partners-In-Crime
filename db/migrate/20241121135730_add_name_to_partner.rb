class AddNameToPartner < ActiveRecord::Migration[7.1]
  def change
    add_column :partners, :name, :string
  end
end
