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
end
