class AnnouncementsController < ApplicationController
  load_and_authorize_resource

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
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @announcement = Announcement.find(params[:id])
  end

  def update
    @announcement = Announcement.find(params[:id])
    if @announcement.update(announcement_params)
      render :show, status: :ok
    else
      render :update, status: :unprocessable_entity
    end
  end

  def destroy
    @announcement.destroy
    redirect_to announcements_path
  end

  def hide_expired
    @announcements = Announcement.expired
    
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
