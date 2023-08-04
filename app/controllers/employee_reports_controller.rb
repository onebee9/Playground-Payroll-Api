class EmployeeReportsController < ApplicationController
  def index
    employee_report_json = ::EmployeeReportService.process_report
    render json: employee_report_json, status: 200
  rescue StandardError => e
    render json: { error: 'Failed to generate report' }, status: :unprocessable_entity
  end
end
