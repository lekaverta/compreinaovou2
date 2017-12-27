class DefaultActiveTicket < ActiveRecord::Migration[5.1]
  def change
    change_column :tickets, :active, :boolean, default: true
  end
end
