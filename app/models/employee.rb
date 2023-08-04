# == Schema Information
#
# Table name: employees
#
#  id           :integer          not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  employee_id  :integer
#  job_group_id :integer
#
# Indexes
#
#  index_employees_on_job_group_id  (job_group_id)
#
# Foreign Keys
#
#  job_group_id  (job_group_id => job_groups.id)
#
class Employee < ApplicationRecord
  has_one :job_group
end
