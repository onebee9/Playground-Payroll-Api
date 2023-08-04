require 'csv'
class TimeReportWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(file_path, report_id)
    @file_path = file_path
    @report_id = report_id

    process_time_report
  end

  private

  def process_time_report
    CSV.foreach(@file_path, headers: true) do |row|
      next if row.nil?

      category = row['job group']
      employee_id = row['employee id']
      hours_worked = row['hours worked']
      work_date = row['date']

      job_group = JobGroup.find_by(category: category)
      employee = Employee.find_or_create_by!(employee_id: employee_id, job_group_id: job_group.id)
      matching_pay_period = PayPeriod.find do |period|
        period.start_date <= work_date.to_date && period.end_date >= work_date.to_date
      end

      create_reports(job_group, hours_worked, work_date, employee, matching_pay_period)
    end
  end

  def create_reports(job_group, hours_worked, work_date, employee, matching_pay_period)
    ActiveRecord::Base.transaction do
      TimeReport.create(
        report_id: @report_id,
        hours_worked: hours_worked,
        work_date: work_date,
        employee: employee,
        job_group: job_group,
        pay_period: matching_pay_period
      )
    end
  end
end
