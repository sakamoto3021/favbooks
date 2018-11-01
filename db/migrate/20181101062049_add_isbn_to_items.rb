class AddIsbnToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :isbn, :string
  end
end
