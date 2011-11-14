class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :title
      t.string :year
      t.text :plot
      t.string :rating
      t.string :poster

      t.timestamps
    end
  end
end
