def func y
  y + yield
end

result = func(1) do
  x = 2
end

p result

# 3-143

{a: 1, b: 3}.each do |key, value|
  p "#{key}: #{value}"
end

# 3-146

5.downto(1) do |i|
  p i
end

# 3-147

4.times do |i|
  p i
end

p "------------------------"

class Test
  def foo(int)
    p int
  end
end

test = Test.new
test.foo(5)

class Foo
  def initialize(a)
    @a = a
  end
  def method1
    @a
  end
end
  
class FooExt < Foo
  def initialize(a,b)
    @b = b
    super a
  end
  def method2(c)
    @a + @b + c
  end
end

fooExt = FooExt.new(3,4)
p fooExt.method1
p fooExt.method2(5)


p doc = <<-EOF
  The quick brown fox
  dog
    EOF

p doc = <<-EOF
  The quick brown fox
  dog
EOF

p str = "RubyAssociation\r"
p str = "RubyAssociation\r".chomp
p str = "RubyAssociation\r".chop
p str = "RubyAssociation\r\n".chop

a = /^[hc].*o$/i
p "Hello".match(a)
p "Cello".match(a)
p "Bello".match(a)
p "Hello".match(/^[hc].*o$/)

p File.join("ruby", "exam", "silver")

puts "ruby".encoding
puts "ruby".encoding.name

cc = {"nz"=>"New Zealand", "ru"=>"Russia", "ar"=>"Argentina"}
p cc.has_key?('nz')
# p cc.contain?('nz')
p cc.key?('nz')
p cc.include?('nz')
p cc.member?('nz')

s = "To be or not to be, that is the question."
p hash = Hash.new(0)
s.scan(/\w+/) {|i| hash[i] += 1}
p hash
p hash["be"]

# raise ArgumentError, "引数が不正です"
err = ArgumentError.new("引数が不正です")
# raise err
# raise "実行中にエラーが発生しました"

begin
  1 / 0
  p 1
rescue
  p 0
end

p "--------------"

begin
  # 1 / 0
  p 1
rescue
  p 0
else
  p 2
ensure
  p 3
end

1 / 0 rescue p 1

def foo
  -1 / 0
rescue
  p 1
end

foo

begin
  1/0
rescue ZeroDivisionError => e
  p e.backtrace
  p e.message
end

b = 0
p b = b || 1
p b = 1 || b

c = 0
p c ||= 1

ary = []
ary << 1 && false
true || ary << 2
false && ary << 3
false || ary << 4
p ary

p "foo" * 2 **3

foo = [1,2,3]
bar = foo
baz = foo.dup

bar[3] = 4
p foo
p foo.object_id
p bar
p bar.object_id
p baz
p baz.object_id

str = "a,b,c,d"
p str.split(/,/, 2)
p str.split(/,/, 3)
p str.split(/,/, 4)

puts "0123456789".delete("0-5 8-")

numbers = [3,89,40,39,29,10,50,59,69]
num = numbers.inject do |i,j|
  i > j ? i : j
end
p num

numbers = [3,89,40,39,29,10,50,59,69]
num = numbers.inject do |i,j|
  p i
  p j
end
p num

numbers = (1..20).to_a
p numbers.detect{|x| x % 5 == 0}

p [1, 2, 3].map {|n| n * 3 }
p [1, 2, 3].each {|n| n * 3 }

member = [10, "Tanaka"]
print "ID:%2d Name:%s" % member

p ?A
# p ?AA
p ?a

array = [5, 6, 7, 8, 9, 10]
p array[1...5]

a = 1,2,3
p a.class
p a.join(",")

a = [1,2,3]
b = [1,3,5]
c = a
p a.object_id
p c.object_id
p a = b & c
p a.object_id
p c.object_id
p a + b + c

a = ["a", "b", "c"]
b = [1, 2, 3]
p [a, b]
p [a, b].transpose
[a, b].transpose.each{|x, y| p [x, y]}

puts "0123456789-".delete("^13-56-")
puts "0123456789-".delete("13-56-")

p /a*b/ === "ab"
p /a*b/ === "b"

h = { "b" => 20, "a" => 30, "c" => 10  }
p h.sort
p h.sort {|a,b| a[1]<=>b[1]}
p h.sort {|a,b| a[0]<=>b[0]}

puts File.join("/", "user", "bin")
puts File.join("/dog", "user", "bin")
puts File.join("dog", "user", "bin")

open('textfile.txt', 'r+') do |f|
  data = f.read.upcase
  f.rewind
  f.puts data
end

def bar(n)
  puts n
end
bar 5

def bar(n)
  puts n
end
bar (10)

def bar(*n1, n2)
  puts n1
  puts n2
end
bar 5, 6, 7, 8

str = "   Liberty Fish   \r\n"
str.strip!
p str

(10..15).to_a.map.with_index(10) do |elem, i|
  puts i
end

h = {a: 100, b: 200}
h.each {|p|
  p p
  p p.class
}

a = [1]
a[5] = 10
a.compact
p a
a.compact!
p a

v1 = 1 - 1 == 0
v2 = v1 || raise(RuntimeError)
puts v2 && false

File.open('testfile.txt', 'a+') do |f|
  f.write("recode 1\n")
  f.seek(0, IO::SEEK_SET)
  f.write("recode 2\n")
end

h = {a: 100, b: 100}
puts h.invert
h = {a: 200, b: 100}
puts h.invert

hoge = *"a"
puts hoge
puts hoge.class

p *h

s = <<-EOF
    Hello,
    Ruby
    EOF
p s

s = <<EOF
    Hello,
    Ruby
EOF
p s

io = File.open('textfile.txt')
while not io.eof?
  io.readlines
  io.seek(0, IO::SEEK_CUR)
  p io.readlines
end

p "-------------------"

$val = 0

class Count
  def self.up
    $val = $val + 1
    $val == 3 ? true : false
  end
end

a = [*1..10].select do
  Count.up
end

p a
p $val

d = Time.new(2015, 1, 5)
puts d.strftime("%x")

p "------------------"

$val = 0

class Count
  def self.up
    $val = $val + 1
    $val == 3 ? true : false
  end
end

[*1..10].any? do
  Count.up
end

p $val

p "Hello%d" % 5

str = "1;2:3;4"
p str.split(";|:")
p str.split(/;|:/)

p [1,2,3,4].map {|e| e * e}

[1,2,3,4].map do |e|
  p e * e
end

p "-----------------"

def hoge1
  x = 0
  1.step(5,1) do |i|
    x += 1
  end
  puts x
end
hoge1

h = Hash.new("default value")
[:a]
h[:b] = 100

p h
p h[:a]