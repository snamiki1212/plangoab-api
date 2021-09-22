class CreateStories < ActiveRecord::Migration[6.1]
  def change
    create_table :stories do |t|
      t.string :name
      t.integer :order
      t.references :calendar, null: false, foreign_key: true

      t.timestamps
    end
  end
end
