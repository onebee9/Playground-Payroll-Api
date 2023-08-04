# == Schema Information
#
# Table name: pay_periods
#
#  id         :integer          not null, primary key
#  end_date   :date
#  start_date :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class PayPeriod < ApplicationRecord
end
