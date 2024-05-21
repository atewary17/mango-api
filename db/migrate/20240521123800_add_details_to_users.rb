class AddDetailsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :phone, :string
    add_column :users, :address, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :identification_number, :string
    add_column :users, :secondary_id_number, :string
  end
end
