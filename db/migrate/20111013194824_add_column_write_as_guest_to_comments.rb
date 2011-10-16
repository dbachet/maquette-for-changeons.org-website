class AddColumnWriteAsGuestToComments < ActiveRecord::Migration
  def self.up
    add_column :comments, :write_as_guest, :boolean
  end

  def self.down
    remove_column :comments, :write_as_guest
  end
end
