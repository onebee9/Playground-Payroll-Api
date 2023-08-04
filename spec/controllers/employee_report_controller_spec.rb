require 'rails_helper'
require 'pry-byebug'

RSpec.describe EmployeeReportsController, type: :controller do
  context 'Returns the correct JSON Object' do
    before(:each) do
      @report_id = 20
      time_reports = [
        { employee_id: 1, hours_worked: 8, work_date: 'Sun, 01 Jan 2023', job_group_id: 1, report_id: @report_id,
          pay_period_id: 1 },
        { employee_id: 1, hours_worked: 7.5, work_date: 'Sun, 15 Jan 2023', job_group_id: 1, report_id: @report_id,
          pay_period_id: 1 },
        { employee_id: 2, hours_worked: 2, work_date: 'Mon, 01 May 2023', job_group_id: 2, report_id: @report_id,
          pay_period_id: 9 },
        { employee_id: 3, hours_worked: 10, work_date: 'Wed, 02 Aug 2023', job_group_id: 2, report_id: @report_id,
          pay_period_id: 15 }
      ]

      employees = [
        { employee_id: 1, job_group_id: 1 },
        { employee_id: 2, job_group_id: 2 },
        { employee_id: 3, job_group_id: 2 }
      ]

      Employee.create!(employees)
      TimeReport.create!(time_reports)
    end

    it 'returns a success status' do
      get :index
      expect(response).to have_http_status(200)
    end

    it 'returns an employee report' do
      get :index

      json = JSON.parse(response.body).deep_symbolize_keys
      expect(json[:payrollReport][:employeeReports]).not_to be_empty
      report_in_list = json[:payrollReport][:employeeReports].first
      expect(report_in_list[:employeeId]).to eq(1)
      expect(report_in_list[:amountPaid]).to eq('$310.00')
    end
  end
end
