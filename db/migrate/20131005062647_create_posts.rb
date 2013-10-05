class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :feeling
      t.integer :functioning

      t.timestamps
    end
  end
end
