class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.references :resource, null: false, foreign_key: true
      t.datetime :started_at
      t.datetime :ended_at
      t.string :title
      t.string :description
      t.string :background_color, null: true

      t.timestamps
    end
  end
end
