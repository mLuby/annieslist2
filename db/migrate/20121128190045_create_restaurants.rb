class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :link
      t.string :address
      t.string :phone
      t.integer :location_id

      t.timestamps
    end
    
    add_index :restaurants, [:location_id]
  end
end
