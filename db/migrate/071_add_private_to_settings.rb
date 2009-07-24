class AddPrivateToSettings < ActiveRecord::Migration
  def self.up
    add_column :settings, :hush_hush, :boolean, :default => false
  end

  def self.down
    remove_column :settings, :hush_hush
  end
end
