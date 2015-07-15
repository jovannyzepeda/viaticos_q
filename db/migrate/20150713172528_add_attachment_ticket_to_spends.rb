class AddAttachmentTicketToSpends < ActiveRecord::Migration
  def self.up
    change_table :spends do |t|
      t.attachment :ticket
    end
  end

  def self.down
    remove_attachment :spends, :ticket
  end
end
