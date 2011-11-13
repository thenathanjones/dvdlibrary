class CreateDirectors < ActiveRecord::Migration
  def change
    create_table :directors do |t|
      t.string :name
      t.references :entry

      t.timestamps
    end
    add_index :directors, :entry_id
  end
end
