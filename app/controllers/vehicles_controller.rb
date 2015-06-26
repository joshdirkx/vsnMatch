class VehiclesController < ApplicationController
  include VSN_Format_Validation

  def search
    pattern = params[:search]

    # if !pattern.vsn_length_check && !pattern.vsn_first_half_check && !pattern.vsn_second_half_check
    #   redirect_to root_path
    # end

    @results = Vehicle.where("vsn_pattern LIKE :pattern", pattern: "#{pattern}%")

    # cars = Vehicle.all

    # counter = 0

    # cars.each do |c|
    #   if c.vsn_pattern[counter] != pattern[counter] || c.vsn_pattern[counter] != '*'
    #     c.pop
    #   else

    #   end
    #   counter++
    #     end

    # BEGIN PSEUDO CODE LAYOUT
    # take pattern = params search
    # split it
    # query database for all items where vsn_patterm[0] matches pattern[0]
    # push those results to new array
    #
    # search new array for all results containing a match at index 1 or return all if *
    # continue until you have searched all input terms
    # END PSEUDO CODE LAYOUT

    # redirect_to vehicles_results_path
  end

  def landing
  end
end


# vsns.each do |i|
#   if i.match(/X*T/)
#     puts i
#   end
# end
