module Homeland::Note
  class Engine < ::Rails::Engine
    isolate_namespace Homeland::Note

    initializer 'homeland.note.init' do |app|
      next unless Setting.has_module?(:note)
      Homeland.register_plugin do |plugin|
        plugin.name = Homeland::Note::NAME
        plugin.display_name = '记事本'
        plugin.version = Homeland::Note::VERSION
        plugin.description = Homeland::Note::DESCRIPTION
        plugin.user_menu_link = true
        plugin.root_path = "/notes"
      end

      app.routes.prepend do
        mount Homeland::Note::Engine => '/'
      end
      app.config.paths["db/migrate"].concat(config.paths["db/migrate"].expanded)
    end
  end
end
