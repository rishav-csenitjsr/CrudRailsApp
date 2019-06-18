class RemoveUsersFromUploads < ActiveRecord::Migration[5.2]
  def change
    remove_column :uploads, :users, :string
  end
end
