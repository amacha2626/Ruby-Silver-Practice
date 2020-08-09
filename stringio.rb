require 'stringio'

sio = StringIO.open "Hello StringIO."

p sio
p sio.class

sio = StringIO.open "Hello StringIO." do |io|
  io.read
end
p sio
p sio.class

sio = StringIO.new
p sio.putc "a"
p sio.string

sio.string = "Hello World"

p sio.read 5
p sio.read
p sio.read
sio.pos = 0
output = ""
sio.read 5, output
p output

sio.string = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
sio.pos = 10
p sio.readline

sio.seek -10, IO::SEEK_END
p sio.readline