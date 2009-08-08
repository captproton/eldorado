class FixCommentResourceId < ActiveRecord::Migration
  def self.up
    rename_column :comments, :resource_id, :begetter_id
    rename_column :comments, :resource_type, :begetter_type
  end

  def self.down
    rename_column :comments, :begetter_type, :resource_type
    rename_column :comments, :begetter_id, :resource_id
  end
end
