module Homeland::Note
  class ApplicationController < ::ApplicationController
    protect_from_forgery with: :exception
    layout "homeland/note/application"

    helper Homeland::Note::ApplicationHelper

    helper_method :current_user_notes

    def current_ability
      @current_ability ||= Homeland::Note::Ability.new(current_user)
    end

    def current_user_notes
      @current_user_notes ||= ::Note.where(user_id: current_user.id)
    end
  end
end
