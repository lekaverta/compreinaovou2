class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.date :date
      t.string :city
      t.string :state
      t.string :country
      t.string :image

      t.timestamps
    end
  end
end
