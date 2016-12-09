class TracksController < ApplicationController
  before_action :require_login
  
  def show
    @track = Track.find_by(id: params[:id])
    render :show
  end

  def new
    @band = Band.find_by(id: params[:band_id])
    render :new
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      @band = Band.find_by(id: track_params[:band_id])
      redirect_to track_url(@track)
    else
      flash[:errors] = @track.errors.full_messages
      render :new
    end
  end

  def edit
    @track = Track.find_by(id: params[:id])
    render :edit
  end

  def update
    @track = Track.find_by(id: params[:id])
    if @track.update_all(track_params)
      redirect_to track_url(@track)
    else
      flash[:errors] = @track.errors.full_messages
      render :edit
    end
  end

  def destroy
    track = Track.find_by(id: params[:id])
    track.destroy
  end

  private
    def track_params
      params.require(:track).permit(:title, :album_id, :status)
    end
end
