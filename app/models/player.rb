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
  has_many(:buildings, { :class_name => "Building", :foreign_key => "builder_id", :dependent => :destroy })
  has_many(:sent_requests, { :class_name => "Transaction", :foreign_key => "sender_id", :dependent => :destroy })
  has_many(:received_requests, { :class_name => "Transaction", :foreign_key => "recipient_id", :dependent => :destroy })
  validates(:name, { :presence => true })
  validates(:name, { :uniqueness => { :message => "Player name already taken" } })
  validates(:kingdom, { :presence => true })
  validates(:kingdom, { :uniqueness => { :case_sensitive => true } })
end
