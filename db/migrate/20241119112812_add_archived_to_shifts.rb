class AddArchivedToShifts < ActiveRecord::Migration[7.2]
  def change
    add_column :shifts, :archived, :boolean, default: false
  end
end
