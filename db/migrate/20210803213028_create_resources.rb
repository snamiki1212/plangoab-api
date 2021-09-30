class CreateResources < ActiveRecord::Migration[6.1]
  def change
    create_table :resources do |t|
      t.string :title
      t.integer :order
      t.references :story, null: false, foreign_key: true

      t.timestamps
    end
  end
end
