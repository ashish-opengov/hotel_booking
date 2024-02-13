class HotelsController < ApplicationController
  def index
    @hotels = Hotel.all
    @hotels = @hotels.where(location: params[:location]) if params[:location].present?
  end
end