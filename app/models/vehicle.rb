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

  def vsn_format_valid?
    # self.vsn_length_check

    vsn_pattern_split = self.vsn_pattern.split('')
    # check if VSN indexes 0-5 are letters
    vsn_pattern_split_characters = vsn_pattern_split[0..5]
    vsn_pattern_split_characters.each do |i|
      if i =~ /[a-zA-Z]/ || i == '*'
        print 'yes'
      else
        print 'no'
      end
    end
    # check if VSN indexes 6-11 are integers
    vsn_pattern_split_integers = vsn_pattern_split[6..11]
    vsn_pattern_split_integers.each do |i|
      if i =~ /\d/ || i == '*'
        print 'yes'
      else
        print 'no'
      end
    end
  end
end

# def vsn_length_check
#   # check if VSN is 12 characters long
#   self.vsn_pattern.length == 12 ? true : false
# end
# end
