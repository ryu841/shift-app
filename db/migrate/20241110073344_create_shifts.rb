class CreateShifts < ActiveRecord::Migration[7.2]
  def change
    create_table :shifts do |t|
      t.date :title_date, null: false
      t.string :comment
      # t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
