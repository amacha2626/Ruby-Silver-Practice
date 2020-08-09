require 'stringio'

sio = StringIO.open "Hello StringIO."

p sio
p sio.class

sio = StringIO.open "Hello StringIO." do |io|
  io.read
end
p sio
p sio.class