class CreateWriters < ActiveRecord::Migration
  def change
    create_table :writers do |t|
      t.string :name
      t.references :entry

      t.timestamps
    end
    add_index :writers, :entry_id
  end
end
