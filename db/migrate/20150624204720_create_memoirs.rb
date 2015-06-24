class CreateMemoirs < ActiveRecord::Migration
  def change
    create_table :memoirs do |t|
      t.string :name, null: false
      t.integer :age, null: false
      t.string :memoir, null: false
      t.integer :neighborhood_id, null: false
      t.timestamps
    end
  end
end
