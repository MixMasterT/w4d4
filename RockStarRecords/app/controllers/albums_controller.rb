class AlbumsController < ApplicationController
  before_action :require_login
  
  def new
    @band = Band.find_by(id: params[:band_id])
    render :new
  end

  def create
    if @album.save
      redirect_to album_url(@ablum)
    else
      flash[:error] = @album.errors.full_messages
      render :new
    end
  end

  def edit
    @album = Album.find_by(id: params[:id])
    render :edit
  end

  def show
    @album = Album.find_by(id: params[:id])
    render :show
  end

  def update
    @album = Album.find_by(id: params[:id])
    if @album.update_attributes(album_params)
      redirect_to album_url(@album)
    else
      flash[:errors] = @album.errors.full_messages
      render :edit
    end
  end

  def destroy
    album = Album.find_by(id: params[:id])
    album.destroy
  end

  private

    def album_params
      params.require(:album).permit(:title, :band_id, :scene)
    end
end
