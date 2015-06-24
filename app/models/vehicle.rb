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
end
