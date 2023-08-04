# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# db/seeds.rb
# include PayPeriodHelper

[
  { category: 'A', wage: 20 },
  { category: 'B', wage: 30 }
].each do |data|
  JobGroup.create!(data)
end

# Define the semi-monthly pay periods for the year 2023
pay_periods = [
  # January
  [Date.new(2023, 1, 1), Date.new(2023, 1, 15)],
  [Date.new(2023, 1, 16), Date.new(2023, 1, 31)],

  # February
  [Date.new(2023, 2, 1), Date.new(2023, 2, 15)],
  [Date.new(2023, 2, 16), Date.new(2023, 2, 28)],

  # March
  [Date.new(2023, 3, 1), Date.new(2023, 3, 15)],
  [Date.new(2023, 3, 16), Date.new(2023, 3, 31)],

  # April
  [Date.new(2023, 4, 1), Date.new(2023, 4, 15)],
  [Date.new(2023, 4, 16), Date.new(2023, 4, 30)],

  # May
  [Date.new(2023, 5, 1), Date.new(2023, 5, 15)],
  [Date.new(2023, 5, 16), Date.new(2023, 5, 31)],

  # June
  [Date.new(2023, 6, 1), Date.new(2023, 6, 15)],
  [Date.new(2023, 6, 16), Date.new(2023, 6, 30)],

  # July
  [Date.new(2023, 7, 1), Date.new(2023, 7, 15)],
  [Date.new(2023, 7, 16), Date.new(2023, 7, 31)],

  # August
  [Date.new(2023, 8, 1), Date.new(2023, 8, 15)],
  [Date.new(2023, 8, 16), Date.new(2023, 8, 31)],

  # September
  [Date.new(2023, 9, 1), Date.new(2023, 9, 15)],
  [Date.new(2023, 9, 16), Date.new(2023, 9, 30)],

  # October
  [Date.new(2023, 10, 1), Date.new(2023, 10, 15)],
  [Date.new(2023, 10, 16), Date.new(2023, 10, 31)],

  # November
  [Date.new(2023, 11, 1), Date.new(2023, 11, 15)],
  [Date.new(2023, 11, 16), Date.new(2023, 11, 30)],

  # December
  [Date.new(2023, 12, 1), Date.new(2023, 12, 15)],
  [Date.new(2023, 12, 16), Date.new(2023, 12, 31)]
]

# Create PayPeriod records for each pay period
pay_periods.each do |start_date, end_date|
  PayPeriod.create!(start_date: start_date, end_date: end_date)
end
