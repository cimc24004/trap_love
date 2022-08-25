class AddPostRandomIdToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :random_id, :string
  end
end
