class AddCaptionIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :caption_id, :string
  end
end
