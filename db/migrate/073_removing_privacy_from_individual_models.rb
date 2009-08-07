class RemovingPrivacyFromIndividualModels < ActiveRecord::Migration
  def self.up
    remove_column :topics, :hush_hush
    remove_column :uploads, :hush_hush
    remove_column :happenings, :hush_hush
  end

  def self.down
    raise IrreversibleMigration
  end
end
