class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.integer :employee_id
      t.references :job_group, foreign_key: true
      t.timestamps
    end
  end
end
