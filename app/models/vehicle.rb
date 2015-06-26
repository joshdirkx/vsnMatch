# == Schema Information
#
# Table name: vehicles
#
#  id          :integer          not null, primary key
#  vsn_pattern :text
#  trim_id     :integer
#  year        :integer
#  make        :string
#  model       :string
#  trim_name   :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Vehicle < ActiveRecord::Base
  def self.seed_vehicle_information(file)
    data = Roo::CSV.new(file)
    data.each do |i|
      vehicle_information             = Vehicle.new
      vehicle_information.vsn_pattern = i[0]
      vehicle_information.trim_id     = i[1]
      vehicle_information.year        = i[2]
      vehicle_information.make        = i[3]
      vehicle_information.model       = i[4]
      vehicle_information.trim_name   = i[5]
      vehicle_information.save
    end
  end

  # def vsn_format_valid?
  #   self.vsn_length_check

  #   self.vsn_first_half_check

  #   self.vsn_second_half_check
  # end


  # def vsn_length_check
  #   # check if 12 characters long
  #   self.length == 12 ? true : false
  # end

  # def vsn_first_half_check
  #   # Check if index 0-5 are characters
  #   vsn_characters = self.split('')[0..5]

  #   vsn_characters.each do |i|
  #     i =~ /[a-zA-Z]/ || i == '*' ? true : false
  #     # if i =~ /[a-zA-Z]/ || i == '*'
  #     #   print 'yes'
  #     # else
  #     #   print 'no'
  #     # end
  #   end
  # end

  # def vsn_second_half_check
  #   # Check if index 6-11 are integers
  #   vsn_integers = self.split('')[6..11]

  #   vsn_integers.each do |i|
  #     i =~ /\d/ || i == '*' ? true : false
  #     # if i =~ /\d/ || i == '*'
  #     #   print 'yes'
  #     # else
  #     #   print 'no'
  #     # end
  #   end
  # end

  def self.most_specific_vsn_match(search_results)
    results = search_results

    paired_results = Hash.new

    results.each do |i|
      wildcard_count = 0

      for char in i.vsn_pattern.split('')
        if char == '*'
          wildcard_count += 1
        end
      end

      paired_results[i.id] = wildcard_count
    end

    # returns results as an array of arrays, sorted by values in ascending order
    paired_results.sort_by { |k,v| v }

    best_match_id = paired_results[0][0].to_i

    return Vehicle.find(best_match_id)
  end

  def self.car_search(search_pattern, start_count=0, array_of_items=Array.new(Vehicle.all))
    # resursively search VSN_PATTERN against user query
    # begin with array of all vehicles and a counter set to zero
    pattern = search_pattern
    counter = start_count
    objects = array_of_items

    # base case, break and return objects when counter equals search length
    return objects if counter == pattern.length

    # begin pattern matching
    if pattern[counter] == '*'
      # if pattern is wildcard, move on
      # increase counter, call function again
      counter += 1
      Vehicle.car_search(pattern, counter, objects)
    else
      # delete object from results if it does not match character in pattern and it is not a wildcard
      objects.delete_if { |c| c.vsn_pattern[counter] != '*' && c.vsn_pattern[counter] != pattern[counter]}
      # if pattern is wildcard, move on
      # increase counter, call function again
      counter += 1
      Vehicle.car_search(pattern, counter, objects)
    end
  end
end
