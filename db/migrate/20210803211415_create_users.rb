class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: true
      t.string :licen_key, null: false

      t.timestamps
    end
  end
end
