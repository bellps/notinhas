class AddNameAndUrlImageAndNicknameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :url_image, :string
    add_column :users, :nickname, :string
  end
end
