class AddUrlTitleToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :url_title, :string
  end
end
