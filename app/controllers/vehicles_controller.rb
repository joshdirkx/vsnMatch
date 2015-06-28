class VehiclesController < ApplicationController
  include VSN_Format_Validation

  def search
    unless vsn_length_check(params[:search]) && vsn_first_half_check(params[:search]) && vsn_second_half_check(params[:search])
      flash[:notice] = 'Incorrect Format'
      redirect_to root_path and return
    end

    @results = Vehicle.car_search(params[:search])

    if @results.length == 0
      flash[:notice] = 'Your query returned no results'
      redirect_to root_path and return
    end

    @found_match = nil

    car_match_id_hash = Vehicle.most_specific_vsn_match(@results)

    @best_match = []

    if car_match_id_hash.count == @results.count
      @found_match = false
    else
      car_match_id_hash.each do |item|
        @best_match.push(Vehicle.find(item[0]))
        @found_match = true
      end
    end
  end

  def landing
  end
end
