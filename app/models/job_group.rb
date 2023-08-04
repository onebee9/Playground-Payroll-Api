# == Schema Information
#
# Table name: job_groups
#
#  id         :integer          not null, primary key
#  category   :string
#  wage       :decimal(18, 2)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class JobGroup < ApplicationRecord
  has_many :employees
end
