class CreateHappenings < ActiveRecord::Migration
  def self.up
    create_table :happenings do |t|
      t.column :title, :string
      t.column :description, :text
      t.column :date, :datetime
    end
  end

  def self.down
    drop_table :happenings
  end
end
