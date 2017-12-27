class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.string :description
      t.integer :quantity
      t.decimal :value
      t.string :email
      t.boolean :active
      t.string :profiles, array: true, default: []
      t.integer :event_id

      t.timestamps
    end
  end
end
