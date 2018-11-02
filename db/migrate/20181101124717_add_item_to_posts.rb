class AddItemToPosts < ActiveRecord::Migration[5.0]
  def change
    add_reference :posts, :item, foreign_key: true
  end
end
