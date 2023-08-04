class CreateTimeReports < ActiveRecord::Migration[7.0]
  def change
    create_table :time_reports do |t|
      t.integer :report_id, null: false
      t.integer :hours_worked, null: false
      t.date :work_date, null: false
      t.references :job_group, foreign_key: true
      t.references :employee, foreign_key: true
      t.references :pay_period, foreign_key: true
      t.timestamps
    end
  end
end
