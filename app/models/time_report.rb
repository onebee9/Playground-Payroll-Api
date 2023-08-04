# == Schema Information
#
# Table name: time_reports
#
#  id            :integer          not null, primary key
#  hours_worked  :decimal(10, 2)   not null
#  work_date     :date             not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  employee_id   :integer
#  job_group_id  :integer
#  pay_period_id :integer
#  report_id     :integer          not null
#
# Indexes
#
#  index_time_reports_on_employee_id    (employee_id)
#  index_time_reports_on_job_group_id   (job_group_id)
#  index_time_reports_on_pay_period_id  (pay_period_id)
#
# Foreign Keys
#
#  employee_id    (employee_id => employees.id)
#  job_group_id   (job_group_id => job_groups.id)
#  pay_period_id  (pay_period_id => pay_periods.id)
#
class TimeReport < ApplicationRecord
  belongs_to :employee
  belongs_to :job_group
  belongs_to :pay_period
  validates :report_id, presence: true
end
