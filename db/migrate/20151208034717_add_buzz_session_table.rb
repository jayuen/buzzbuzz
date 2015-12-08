class AddBuzzSessionTable < ActiveRecord::Migration
  def change
    create_table :buzz_sessions do |t|
      t.timestamps
      t.integer :next_buzz_sequence
    end
  end
end
