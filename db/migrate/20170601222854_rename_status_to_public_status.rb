class RenameStatusToPublicStatus < ActiveRecord::Migration[5.1]
  def change
    rename_column :cards, :status, :public_status
  end
end
