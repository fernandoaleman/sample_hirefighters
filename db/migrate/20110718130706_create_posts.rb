class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :column_one
      t.string :column_two
      t.string :column_three
      t.string :column_four
      t.string :column_five
      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
