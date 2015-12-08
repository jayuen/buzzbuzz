class RenameNextBuzzSequenceColumn < ActiveRecord::Migration
  def change
    rename_column :buzz_sessions, :next_buzz_sequence, :winning_buzz_id
  end
end
