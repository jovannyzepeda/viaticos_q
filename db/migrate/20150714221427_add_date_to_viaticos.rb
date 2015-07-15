class AddDateToViaticos < ActiveRecord::Migration
  def change
    add_column :viaticos, :fecha, :date
  end
end
