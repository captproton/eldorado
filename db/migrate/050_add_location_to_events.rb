class AddLocationToHappenings < ActiveRecord::Migration
  def self.up
    add_column :happenings, :location, :text
  end

  def self.down
    remove_column :happenings, :location
  end
end
