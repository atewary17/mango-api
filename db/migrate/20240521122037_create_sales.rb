class CreateSales < ActiveRecord::Migration[7.0]
  def change
    create_table :sales do |t|
      t.date :date
      t.string :store
      t.string :town
      t.string :store_code
      t.string :country
      t.references :user, null: false, foreign_key: true
      t.string :category
      t.decimal :sale

      t.timestamps
    end
  end
end
