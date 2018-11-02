class AddAuthorToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :author, :string
  end
end
