# == Schema Information
#
# Table name: building_instructions
#
#  id                 :integer          not null, primary key
#  building_type_name :string
#  buildings_count    :integer
#  clay_cost          :integer
#  clay_drop_prob     :float
#  grain_cost         :integer
#  grain_drop_prob    :float
#  points_value       :integer
#  steel_cost         :integer
#  steel_drop_prob    :float
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class BuildingInstruction < ApplicationRecord
end
