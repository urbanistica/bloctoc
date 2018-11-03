class CreateTransmissions < ActiveRecord::Migration[5.2]
  def change
    create_table :transmissions do |t|
      t.text :payload
      t.integer :user_id
      t.integer :bloc_id

      t.timestamps
    end
  end
end
