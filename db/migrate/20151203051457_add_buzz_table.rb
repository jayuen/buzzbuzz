class AddBuzzTable < ActiveRecord::Migration
  def change
    create_table :buzzes do |t|
      t.timestamps
      t.string :name
    end
  end
end
