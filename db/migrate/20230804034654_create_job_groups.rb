class CreateJobGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :job_groups do |t|
      t.string :category
      t.decimal :wage, precision: 18, scale: 2
      t.timestamps
    end
  end
end
