class ReadingsController < ApplicationController
  before_action :authenticate_user!
  def index
    @readings = Reading.all
  end

  def show
    @reading = Reading.find(params[:id])
  end

  def new
  end

  def edit
  end
end
