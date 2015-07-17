class AddStatusToSpends < ActiveRecord::Migration
  def change
    add_column :spends, :status, :integer, default: 1
  end
end
