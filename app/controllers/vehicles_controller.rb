class VehiclesController < ApplicationController
  include VSN_Format_Validation

  def search
    pattern = params[:search]

    @results = Vehicle.where("vsn_pattern LIKE :pattern", pattern: "#{pattern}%")
  end

  def landing
  end
end
