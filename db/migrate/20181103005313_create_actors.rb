class CreateActors < ActiveRecord::Migration[5.2]
  def change
    create_table :actors do |t|
      t.text :status

      t.timestamps
    end
    
    create_table :actors_blocs, :id => false do |t|
      t.integer :actor_id
      t.integer :bloc_id
    end
  end
end
