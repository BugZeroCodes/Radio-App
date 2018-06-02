class ReadingsController < ApplicationController
  before_action :authenticate_user!
  def index
    @readings = Reading.all
  end

  def show
    @reading = Reading.find(params[:id])
  end

  def new
    @reading = Reading.new
  end

  def create
    @reading = current_user.readings.new(reading_params)
    if @reading.save
      render :show, status: :created
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @reading = Reading.find(params[:id])
  end

  def update
    @reading = Reading.find(params[:id])
    if @reading.update(reading_params)
      render :show, status: :ok
    else
      render :update, status: :unprocessable_entity
    end
  end

  def destroy
    @reading.destroy
    redirect_to readings_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reading
      @reading = reading.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reading_params
      params.require(:reading).permit(:announcement_id, :recited_at)
    end
end
