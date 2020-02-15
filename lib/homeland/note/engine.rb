# frozen_string_literal: true

module Homeland::Note
  class Engine < ::Rails::Engine
    isolate_namespace Homeland::Note

    initializer 'homeland.site.migrate' do |_app|
      Homeland.migrate_plugin(File.expand_path('../../../migrate', __dir__))
    end

    initializer 'homeland.note.init' do |app|
      app.routes.prepend do
        mount Homeland::Note::Engine => '/'
      end
    end
  end
end
