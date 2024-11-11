class CreateShortfalls < ActiveRecord::Migration[7.2]
  def change
    create_table :shortfalls do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.integer :require_count
      t.references :shift, foreign_key: true, null: false
      t.timestamps
    end
  end
end
