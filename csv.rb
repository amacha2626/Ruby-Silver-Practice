require 'csv'

CSV.open("sample.csv") do |csv|
  csv.each do |row|
    p row
  end
end
