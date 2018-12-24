class FixColumnsAfter < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :user_id, :integer
    add_column :posts, :image_name, :string
    add_column :topics, :user_id, :integer
  end
end
