class AddDefaultToLikesForPosts < ActiveRecord::Migration[6.1]
  def change
    change_column_default :posts, :likes, from: nil, to: 0
  end
end
