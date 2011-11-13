class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |t|
      t.string :name
      t.references :entry

      t.timestamps
    end
    add_index :genres, :entry_id
  end
end
