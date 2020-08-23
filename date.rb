require 'date'

p DateTime.new(2011, 7, 19) - DateTime.new(2010, 8, 27)
p DateTime.new(2011, 7, 19) - DateTime.new(2010, 7, 19)

start_from = Date.new(2017, 7, 1)
end_to = Date.new(2017, 7, 31)
start_from.step(end_to, 7) do |date|
  p date.to_s
end

p DateTime.now.leap?