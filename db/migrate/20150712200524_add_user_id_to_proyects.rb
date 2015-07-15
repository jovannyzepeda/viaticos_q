class AddUserIdToProyects < ActiveRecord::Migration
  def change
    add_reference :proyects, :user, index: true, foreign_key: true
  end
end
