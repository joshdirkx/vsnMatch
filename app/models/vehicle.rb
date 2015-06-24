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
end
