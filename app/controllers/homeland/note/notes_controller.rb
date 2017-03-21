module Homeland::Note
  class NotesController < Homeland::Note::ApplicationController
    before_action :authenticate_user!
    before_action :set_recent_notes, only: [:index, :show, :edit, :new, :create, :update]

    def index
      @notes = current_user_notes.recent_updated.page(params[:page])
    end

    def show
      @note = ::Note.find(params[:id])
      authorize! :read, @note
      @note.hits.incr(1)
    end

    def new
      authorize! :create, Note
      @note = current_user_notes.build
    end

    def edit
      @note = current_user_notes.find(params[:id])
      authorize! :update, @note
    end

    def create
      authorize! :create, Note
      @note = Note.new(note_params)
      @note.user_id = current_user.id
      @note.publish = note_params[:publish] == '1'
      if @note.save
        redirect_to(@note, notice: "创建成功。")
      else
        render action: 'new'
      end
    end

    def update
      @note = current_user_notes.find(params[:id])
      authorize! :update, @note
      if @note.update(note_params)
        redirect_to(@note, notice: "更新成功。")
      else
        render action: 'edit'
      end
    end

    def preview
      out = Homeland::Markdown.call(params[:body])
      render plain: out
    end

    def destroy
      @note = current_user_notes.find(params[:id])
      authorize! :destroy, @note
      @note.destroy

      redirect_to(notes_url)
    end

    private

    def set_recent_notes
      @recent_notes = current_user_notes.recent.limit(10)
    end

    def note_params
      params.require(:note).permit(:title, :body, :publish)
    end
  end
end
