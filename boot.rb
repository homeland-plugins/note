# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

require 'homeland/note'

Homeland.register_plugin do |plugin|
  plugin.name = 'note'
  plugin.display_name = '记事本'
  plugin.version = Homeland::Note::VERSION
  plugin.description = '简单的记事本'
  plugin.user_menu_link = true
  plugin.root_path = '/notes'
  plugin.admin_navbar_link = true
  plugin.admin_path = '/admin/notes'
end
