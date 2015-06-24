class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.text :vsn_pattern
      t.integer :trim_id
      t.integer :year
      t.string :make
      t.string :model
      t.text :trim_name

      t.timestamps null: false
    end
  end
end
