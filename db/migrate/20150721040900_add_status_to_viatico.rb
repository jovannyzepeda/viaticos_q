class AddStatusToViatico < ActiveRecord::Migration
  def change
    add_column :viaticos, :status, :integer, default: 0
  end
end
