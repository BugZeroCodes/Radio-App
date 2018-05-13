class AnnouncementsController < ApplicationController

  before_action :authenticate_user!
  def index
    @announcements = Announcement.all
  end

  def new
    @announcement = Announcement.new
  end

  def show
    @announcement = Announcement.find(params[:id])
  end

  def create
    @announcement = Announcement.new(announcement_params)
    if @announcement.save
      render :show, status: :created
    else
    end
  end

  def edit
    @announcement = Announcement.find(params[:id])
  end

  def update
    if @announcement.update(announcement_params)
      render :show, status: :ok
    else
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_announcement
      @announcement = announcement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def announcement_params
      params.require(:announcement).permit(:text, :expires_at)
    end
end
