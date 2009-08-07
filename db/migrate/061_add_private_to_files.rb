class AddPrivateToFiles < ActiveRecord::Migration
  def self.up
    add_column :uploads, :hush_hush, :boolean, :default => false
  end

  def self.down
    remove_column :uploads, :hush_hush
  end
end
