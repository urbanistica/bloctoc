class CreateBlocs < ActiveRecord::Migration[5.2]
  def change
    create_table :blocs do |t|
      t.decimal :lat1, :precision => 10, :scale => 5
      t.decimal :lat2, :precision => 10, :scale => 5
      t.decimal :lng1, :precision => 10, :scale => 5
      t.decimal :lng2, :precision => 10, :scale => 5

      t.timestamps
    end
  end
end
