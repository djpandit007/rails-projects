class IncludeIndexes < ActiveRecord::Migration
  def up
		add_index :reviews, :movie_id
    add_index :reviews, :moviegoer_id
  end

  def down
		remove_index :reviews, :movie_id
    remove_index :reviews, :moviegoer_id
  end
end
