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
end
