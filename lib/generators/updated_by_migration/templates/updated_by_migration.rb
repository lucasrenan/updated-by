class UpdatedByMigration < ActiveRecord::Migration
  def self.up
    create_table :updated_actions do |t|
      t.integer :updated_id
      t.string  :updated_type
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
    
    add_index :updated_actions, [:updated_id, :updated_type]
  end

  def self.down
    drop_table :updated_actions
  end
end