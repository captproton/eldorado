class RemoveHappeningsLocation < ActiveRecord::Migration
  def self.up
    remove_column :happenings, :location
  end

  def self.down
    raise IrreversibleMigration
  end
end
