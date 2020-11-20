# == Schema Information
#
# Table name: buildings
#
#  id               :integer          not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  builder_id       :integer
#  building_type_id :integer
#
class Building < ApplicationRecord
  belongs_to(:builder, { :required => true, :class_name => "Player", :foreign_key => "builder_id", :counter_cache => true })
  belongs_to(:building_type, { :required => true, :class_name => "BuildingInstruction", :foreign_key => "building_type_id", :counter_cache => true })
end
