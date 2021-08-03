class CreateVisitors < ActiveRecord::Migration[6.1]
  def change
    create_table :visitors do |t|
      t.datetime :birthday

      t.timestamps
    end
  end
end
