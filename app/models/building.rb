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
    
validate :sufficient_steel, :sufficient_grain, :sufficient_clay
 
  def sufficient_steel
    if builder.steel_amount < building_type.steel_cost
      errors.add(:expiration_date, "Not enough steel!")
    end
  end
 
   def sufficient_grain
    if builder.grain_amount < building_type.grain_cost
      errors.add(:expiration_date, "Not enough grain!")
    end
  end
  
  def sufficient_clay
    if builder.clay_amount < building_type.clay_cost
      errors.add(:expiration_date, "Not enough clay!")
    end
  end

  
end
