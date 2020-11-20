# == Schema Information
#
# Table name: players
#
#  id                      :integer          not null, primary key
#  buildings_count         :integer
#  clay_amount             :integer
#  email                   :string
#  grain_amount            :integer
#  kingdom                 :string
#  name                    :string
#  password_digest         :string
#  points                  :integer
#  received_requests_count :integer
#  sent_requests_count     :integer
#  steel_amount            :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#
class Player < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password
end
