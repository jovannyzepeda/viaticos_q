class CreateSpends < ActiveRecord::Migration
  def change
    create_table :spends do |t|
      t.references :proyect, index: true, foreign_key: true
      t.date :fecha
      t.string :tipo
      t.decimal :importe, precision: 7, scale: 2
      t.text :comntarios
      t.integer :comprobante
      t.string :numero_comprobante
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
