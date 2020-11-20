# == Schema Information
#
# Table name: transactions
#
#  id              :integer          not null, primary key
#  clay_offered    :integer
#  clay_requested  :integer
#  grain_offered   :integer
#  grain_requested :integer
#  greetings       :text
#  status          :string
#  steel_offered   :integer
#  steel_requested :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  recipient_id    :integer
#  sender_id       :integer
#
class Transaction < ApplicationRecord
  belongs_to(:sender, { :required => true, :class_name => "Player", :foreign_key => "sender_id", :counter_cache => :sent_requests_count })
  belongs_to(:recipient, { :required => true, :class_name => "Player", :foreign_key => "recipient_id", :counter_cache => :received_requests_count })
end
