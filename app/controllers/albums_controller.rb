# frozen_string_literal: true

class AlbumsController < ActionController::Base
  def index
    render_json(Album.all)
  end

  def create
    render_json(Album.create!(album_params))
  end

  def update
    album.update!(album_params)
    render_json(album)
  end

  def destroy
    album.destroy!
    head :no_content
  end

  def show
    render_json(album)
  end

  private

  def album
    @_album = Album.find(params[:id])
  end

  def album_params
    params.require(:album).permit(:title, :performer, :cost)
  end

  def render_json(item)
    render json: item, status: :ok
  end
end
