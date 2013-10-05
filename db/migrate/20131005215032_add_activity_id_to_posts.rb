class AddActivityIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :activity_id, :integer
  end
end
