class Api::NotesController < ApplicationController
  def index
    render json: Note.all
  end

  def create
    note = Note.create!(safe_params)
    render json: note, status: 201
  end

  def update
    note.update_attributes(safe_params)
    render nothing: true, status: 204
  end

  def destroy
    note.destroy
    render nothing: true, status: 204
  end

  def safe_params
    params.require(:note).permit(:title, :body)
  end

  def note
    Note.find(params[:id])
  end

end
