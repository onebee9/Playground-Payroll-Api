class EmployeeReportService
  class << self
    def process_report
      employee_pay_data = calculate_amount_paid_by_pay_period
      generate_employee_report_json(employee_pay_data)
    end

    private

    def calculate_amount_paid_by_pay_period
      employee_pay_data = []

      time_report_data.each do |data|
        employee_pay_data << {
          "employeeId": data.employee_id,
          "payPeriod": {
            "startDate": data.start_date.to_date,
            "endDate": data.end_date.to_date
          },
          "amountPaid": format('$%.2f', data.total_amount_paid)
        }
      end

      employee_pay_data
    end

    def time_report_data
      # SQL query to aggregate the data directly from the database
      TimeReport.joins(:job_group, :pay_period)
                .group('time_reports.employee_id', 'time_reports.pay_period_id')
                .select('time_reports.employee_id',
                        'pay_periods.start_date AS start_date',
                        'pay_periods.end_date AS end_date',
                        'SUM(job_groups.wage * time_reports.hours_worked) AS total_amount_paid')
    end

    def generate_employee_report_json(employee_pay_data)
      sorted_employee_data = employee_pay_data.sort_by do |report|
        [report[:employeeId], report[:payPeriod][:startDate]]
      end

      JSON.generate({ "payrollReport": {
                      "employeeReports": sorted_employee_data
                    } })
    end
  end
end
