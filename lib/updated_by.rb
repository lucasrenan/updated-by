require "active_record"
require "updated_by/updated"

if defined?(ActiveRecord::Base)
  require "adapters/active_record"
  ActiveRecord::Base.send :include, UpdatedBy::Updated
end