module Homeland::Note::Admin
  class NotesController < ::Admin::ApplicationController
    layout "layouts/admin"

    def index
      @notes = Note.published.includes(:user).order("id desc").page(params[:page])
    end

    def destroy
      @note = Note.find(params[:id])
      @note.destroy
      redirect_to admin_notes_path
    end
  end
end
