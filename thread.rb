require 'thread'

s = Thread.new{
  5.times{ print "s"; sleep 1}
}
t = Thread.new{
  5.times{ print "t"; sleep 1}
}
s.join
t.join
puts