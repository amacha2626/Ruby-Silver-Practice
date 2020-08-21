require 'socket'
server = TCPServer.new 10080
loop {
  client = server.accept
  client.puts "Hello TCPServer."
  client.close
}

socket = TCPSocket.new "localhost", 10080
while line = socket.gets
  puts line
end