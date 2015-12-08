class AddBuzzSessionIdToBuzzes < ActiveRecord::Migration
  def change
    add_column :buzzes, :buzz_session_id, :integer
  end
end
