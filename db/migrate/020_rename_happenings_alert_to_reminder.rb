class RenameHappeningsAlertToReminder < ActiveRecord::Migration
  def self.up
    rename_column :happenings, :alert, :reminder
  end

  def self.down
    rename_column :happenings, :reminder, :alert
  end
end
