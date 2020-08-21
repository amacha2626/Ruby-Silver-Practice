require 'net/http'

net = Net::HTTP.new("docs.ruby-lang.org")
net.start
res = net.get("/ja/2.1.0/doc/index.html")
net.finish
p res

