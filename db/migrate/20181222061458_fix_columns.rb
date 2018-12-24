class FixColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :user_id, :integer
    remove_column :posts, :image_name, :string
    remove_column :topics, :user_id, :integer
  end
end
