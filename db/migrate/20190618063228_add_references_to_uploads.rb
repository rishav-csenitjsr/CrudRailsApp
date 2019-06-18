class AddReferencesToUploads < ActiveRecord::Migration[5.2]
  def change
    add_reference :uploads, :user, foreign_key: true
  end
end
