class NotesController < ApplicationController
  def new
  end

  def index
    render json: notes
  end

  def create
    note = notes.create!(safe_params)
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

end

