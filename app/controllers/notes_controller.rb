class NotesController < ApplicationController
  layout "site"
  before_action :authenticate_user!, except: [ :show ]
  before_action :set_note, only: [ :show, :edit, :update, :destroy ]
  authorize_resource except: [ :index, :new, :create ]

  def index
  end

  def show
  end

  def edit
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    @note.user = current_user

    if @note.save
        redirect_to notes_path, notice: 'ok!'
    else
        render :show
    end
  end

  def update
    if @note.update(note_params)
      redirect_to notes_path, notice: 'ok!'
    else
      render :edit 
    end
  end

  def destroy
    if @note.destroy
      redirect_to notes_path, notice: 'ok!'
    else
        render :edit 
    end
  end

  private
    def note_params
        params.require(:note).permit(:title, :description, :public)
    end

    def set_note
        @note = Note.find(params[:id])
    end

end
