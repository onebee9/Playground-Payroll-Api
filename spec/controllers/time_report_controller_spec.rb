require 'rails_helper'

RSpec.describe TimeReportsController do
  before(:each) do
    @file = fixture_file_upload('time-report-20.csv', 'text/csv')
    @file_path = @file.path
    @report_id = 20

    post :create, params: { file_path: @file_path }

    Sidekiq::Testing.fake! do
      TimeReportWorker.perform_async(@file_path, @report_id)
    end
  end

  it 'returns a success response' do
    expect(response).to have_http_status(200)
    expect(JSON.parse(response.body)).to eq({ 'message' => 'File submitted for processing' })
  end

  it 'schedules the report worker job' do
    expect(TimeReportWorker.jobs.size).to eq(1)
  end

  it 'performs the job' do
    expect(TimeReportWorker.jobs[0]['args']).to eq([@file_path, @report_id])
  end

  it 'creates a record' do
    expect(TimeReport.find(1).id).to eq(1)
  end
end
