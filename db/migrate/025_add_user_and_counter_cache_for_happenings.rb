class AddUserAndCounterCacheForHappenings < ActiveRecord::Migration
  def self.up
    add_column :users, :happenings_count, :integer, :default => 0
    add_column :happenings, :user_id, :integer
    Happening.find(:all).each do |e|
      e.update_attribute :user_id, 1 if e.user_id.nil?
    end
  end

  def self.down
    remove_column :users, :happenings_count
    remove_column :happenings, :user_id
  end
end
