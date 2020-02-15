# frozen_string_literal: true

module Homeland::Note
  class Engine < ::Rails::Engine
    isolate_namespace Homeland::Note

    initializer 'homeland.site.migrate' do |_app|
      migrate_paths = [File.expand_path('../../../migrate', __dir__)]

      # Execute Migrations on engine load.
      ActiveRecord::Migrator.migrations_paths += migrate_paths
      begin
        ActiveRecord::Tasks::DatabaseTasks.migrate
      rescue ActiveRecord::NoDatabaseError
      end
    end

    initializer 'homeland.note.init' do |app|
      app.routes.prepend do
        mount Homeland::Note::Engine => '/'
      end
    end
  end
end
