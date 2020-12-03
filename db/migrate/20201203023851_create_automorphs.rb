class CreateAutomorphs < ActiveRecord::Migration[6.0]
  def change
    create_table :automorphs do |t|
      t.integer :input
      t.string :result

      t.timestamps
    end
    add_index :automorphs, :input, unique: true
  end
end
