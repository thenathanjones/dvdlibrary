class CreateActors < ActiveRecord::Migration
  def change
    create_table :actors do |t|
      t.string :name
      t.references :entry

      t.timestamps
    end
    add_index :actors, :entry_id
  end
end
