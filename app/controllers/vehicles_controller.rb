class VehiclesController < ApplicationController
  include VSN_Format_Validation

  def search
    pattern = params[:search]

    cars = []

    Vehicle.all.each do |i|
      cars.push(i)
    end

    @results = Vehicle.car_search(params[:search], 0, cars)

    # @results = Vehicle.where("vsn_pattern LIKE :pattern", pattern: "#{pattern}%")
  end

  def landing
  end
end
