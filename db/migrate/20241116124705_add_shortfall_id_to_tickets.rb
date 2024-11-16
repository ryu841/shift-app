class AddShortfallIdToTickets < ActiveRecord::Migration[7.2]
  def change
    add_column :tickets, :shortfall_id, :integer
  end
end
