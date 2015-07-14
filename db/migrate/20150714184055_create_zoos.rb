class CreateZoos < ActiveRecord::Migration
  def change
    create_table :zoos do |t|
      t.string :name
      t.string :location
      t.integer :year_opened

      t.timestamps null: false
    end
  end
end
