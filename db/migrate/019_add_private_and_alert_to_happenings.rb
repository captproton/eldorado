class AddPrivateAndAlertToHappenings < ActiveRecord::Migration
  def self.up
    add_column :happenings, :hush_hush, :boolean, :default => false
    add_column :happenings, :alert, :boolean, :default => false
  end

  def self.down
  end
end
