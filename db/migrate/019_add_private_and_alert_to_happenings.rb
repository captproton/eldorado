class AddPrivateAndAlertToHappenings < ActiveRecord::Migration
  def self.up
    add_column :happenings, :private, :boolean, :default => false
    add_column :happenings, :alert, :boolean, :default => false
  end

  def self.down
  end
end
