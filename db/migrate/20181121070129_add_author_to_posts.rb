class AddAuthorToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :author, :string
    add_column :posts, :genre, :string
  end
end
