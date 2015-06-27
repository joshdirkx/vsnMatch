class VehiclesController < ApplicationController
  include VSN_Format_Validation

  def search
    if !vsn_length_check(params[:search])
      flash[:notice] = 'Invalid Length'
      redirect_to root_path
    else !vsn_first_half_check(params[:search]) || !vsn_second_half_check(params[:search])
      flash[:notice] = 'Incorrect Format'
      redirect_to root_path
    end

    @found_match = nil

    pattern = params[:search]

    @results = Vehicle.car_search(params[:search])

    @most_likely_match = Vehicle.most_specific_vsn_match(@results)

    if @most_likely_match.count == 1
      @most_likely_match = Vehicle.find(@most_likely_match.first[0])
      @found_match = true
    else
      @found_match = false
    end
  end

  def landing
  end
end
