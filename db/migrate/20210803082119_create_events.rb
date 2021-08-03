class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.datetime :started_at
      t.datetime :ended_at
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
