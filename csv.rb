require 'csv'

CSV.open("sample.csv") do |csv|
  csv.each do |row|
    p row
  end
end

# CSV.open("sample.csv", "a+") do |row|
#   row << ["dog", "cat", "bird"]
#   row << ["inu", "neko", "tori"]
# end