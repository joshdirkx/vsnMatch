class VehiclesController < ApplicationController
  include VSN_Format_Validation

  def search
    # if !vsn_format_valid(params[:search])
    #   return_to root_path
    # end

    pattern = params[:search]

    @results = Vehicle.car_search(params[:search])
  end

  def landing
  end
end
