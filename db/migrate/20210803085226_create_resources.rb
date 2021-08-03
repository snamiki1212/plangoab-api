class CreateResources < ActiveRecord::Migration[6.1]
  def change
    create_table :resources do |t|
      t.string :field
      t.integer :order
      t.string :event_border_color

      t.timestamps
    end
  end
end
