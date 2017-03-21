module Homeland::Note
  module ApplicationHelper
    def note_title_tag(note, opts = {})
      opts[:limit] ||= 50
      return '' if note.blank?
      return '' if note.title.blank?
      truncate(note.title.delete('#'), length: opts[:limit])
    end
  end
end
