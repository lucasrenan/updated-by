class UpdatedByMigrationGenerator < Rails::Generators::NamedBase
  include Rails::Generators::Migration
        
  source_root File.expand_path('../templates', __FILE__)

  
  def self.next_migration_number(dirname)
    if ActiveRecord::Base.timestamped_migrations
      Time.now.utc.strftime("%Y%m%d%H%M%S")
    else
      "%.3d" % (current_migration_number(dirname) + 1)
    end
   end
  
  desc "generates migration for updated action model"
  def create_migration_file
    migration_template "updated_by_migration.rb", "db/migrate/updated_by_migration.rb"
  end
end
