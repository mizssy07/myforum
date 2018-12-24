class AddColumnToPostsDeleteFlag < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :delete_flag, :integer
  end
end
