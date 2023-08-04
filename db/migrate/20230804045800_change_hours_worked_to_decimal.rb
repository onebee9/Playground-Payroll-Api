class ChangeHoursWorkedToDecimal < ActiveRecord::Migration[7.0]
  def change
    change_column :time_reports, :hours_worked, :decimal, precision: 10, scale: 2
  end
end
