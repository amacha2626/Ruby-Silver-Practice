require 'json'

json = <<-DATA
["Red", "Green", "Blue"]
DATA

p JSON.load(json)