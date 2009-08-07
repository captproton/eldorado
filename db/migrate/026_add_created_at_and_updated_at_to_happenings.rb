class AddCreatedAtAndUpdatedAtToHappenings < ActiveRecord::Migration
  def self.up
    add_column :happenings, :created_at, :datetime
    add_column :happenings, :updated_at, :datetime
    Happening.find(:all).each do |e|
      e.update_attribute :created_at, Time.now.utc if e.created_at.nil?
      e.update_attribute :updated_at, Time.now.utc if e.updated_at.nil?
    end
  end

  def self.down
    remove_column :happenings, :created_at
    remove_column :happenings, :updated_at
  end
end
