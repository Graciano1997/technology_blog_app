class RemoveImageFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :image, :binary
  end
end
