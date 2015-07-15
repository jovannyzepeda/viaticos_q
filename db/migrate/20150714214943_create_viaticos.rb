class CreateViaticos < ActiveRecord::Migration
  def change
    create_table :viaticos do |t|
      t.references :user, index: true, foreign_key: true
      t.references :proyect, index: true, foreign_key: true
      t.decimal :cantidad, precision: 8, scale: 2

      t.timestamps null: false
    end
  end
end
