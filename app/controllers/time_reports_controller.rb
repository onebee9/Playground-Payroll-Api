class TimeReportsController < ApplicationController
  def create
    raise MissingParamError, 'File not included' unless time_report_params[:file_path]
    raise DuplicateFileError, 'File has been processed before' if time_report_already_processed?

    TimeReportWorker.perform_async(time_report_params[:file_path], report_id)
    render json: { message: 'File submitted for processing' }, status: 200
  rescue MissingParamError, DuplicateFileError => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  def time_report_params
    params.permit(:file_path)
  end

  def time_report_already_processed?
    TimeReport.find_by(report_id: report_id)
  end

  def report_id
    @report_id ||= filename[-6, 2]
  end

  def filename
    @filename ||= File.basename(time_report_params[:file_path])
  end
end
