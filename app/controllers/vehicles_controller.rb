class VehiclesController < ApplicationController
  def search
    @results = Vehicle.where("vsn_pattern LIKE ?", "%#{params[:search]}%")
    # redirect_to vehicles_results_path
  end

  def landing
  end
end
