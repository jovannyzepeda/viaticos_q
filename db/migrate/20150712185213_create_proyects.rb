class CreateProyects < ActiveRecord::Migration
  def change
    create_table :proyects do |t|
      t.references :zone, index: true, foreign_key: true
      t.string :name

      t.timestamps null: false
    end
  end
end
