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

p "---------------"

(1..10).each
.reverse_each
.each do |i|
  puts i
end

(1..10).each \
.reverse_each \
.each do |i|
  puts i
end

p "-----------------"

a = "Ruby"
b = " on Rails"
a.concat b
a.reverse!
p a
p a.index("R", 1)

x = 1
y = 1
p x.object_id
p y.object_id

puts '80'.oct

p "foobarfoobar".index("bar", 6)

p "---------------"

def hoge3(step = 1)
  current = 0
  Proc.new {
    current += step
  }
end

p1 = hoge3
p2 = hoge3(2)

p1.call
p1.call
p1.call
p2.call
p2.call

p p1.call
p p2.call

def foo(n)
  n ** n
end

puts foo (2) * 2
puts foo(2) * 2

(1..10).each_cons(3) {|arr| p arr }
p "-----------------"
(1..10).each_slice(3) {|arr| p arr }

taro = 0
def taro
  x = 0
  5.times do |i|
    x += 1
  end
  x
end
puts taro

p "Hello" % 5

h = {a: 100, b: 100}
puts h.invert

a, = (1..5).partition(&:odd?)
p a

dog, = 1, 2
p dog

p Hash[]

p 0xFF

p Time.now.strftime("%Y-%m-%d")
p Time.now.strftime("%F")
p Time.now.strftime("%x")

(1..10).each
.reverse_each
.each do |i|
  puts i
end

(1..10).each.
reverse_each.
each do |i|
  puts i
end

(1..10).to_a.each.
reverse_each.
each do |i|
  puts i
end

(1..10).each \
.reverse_each \
.each do |i|
  puts i
end

a1 = [1,2,3]
a2 = [4,2,3]

p a1 | a2

puts("abcdefghijklmnopqrstuvwxyz".split(//))

p [{:foo => 1}, ["bar", 2]].map{|i| i.to_s }.sort

hash = {:foo => 1, :bar => 2}
p hash.delete(:foo)

module Dog
  Bar = "bar"
end
 
class Baz
  include Dog
end
 
puts Baz::Bar
puts Dog::Bar

@v1 = 1
class Qux3
  @v2 = 2
  def method3
    puts @v1
  end
  def method4
    puts @v2
  end
end

Qux3.new.method3
Qux3.new.method4

class Qux4
  attr_accessor :v3
  def method1; v3; end
end
qux4 = Qux4.new
p qux4.v3 = 3
p qux4.method1

class Qux4Ext < Qux4
end

qux4Ext = Qux4Ext.new
p qux4Ext.v3 = 4
p qux4Ext.v3
p qux4.method1

Foo = "main"
 
class Bar
  Foo = "foo"
 
  def self.foo
    ::Foo
  end
end
 
p Bar.foo
p Bar::Foo

File.open("hats.txt", "w") do |f|
  f.puts(%w[Bowler Deerstalker Dunce\ cap Fedora Fez])
end
 
File.open("hats.txt") do |f|
  4.times { f.gets() }
  puts f.gets
  puts f.gets
  # puts f.readline
end

a = %w[Bowler Deerstalker Dunce\ cap Fedora Fez]
p a
p a.class

file = File.open("hello.rb", "w")
stat = file.stat
mtime1 = stat.mtime
file.puts("new data")
file.flush
mtime2 = stat.mtime

p mtime1
p mtime2
p file.mtime
p mtime1 == mtime2

# ["tmp", "tmp/lang",  "tmp/lang/ruby", "tmp/lang/python"].each do |dir|
#   Dir.mkdir(dir)
# end
# Dir.chdir("tmp/lang")
# p Dir.new(".")
# Dir.new(".").each do |entry|
#   filename = File.join(entry, "rocking.rb")
#   File.open(filename, "w")
# end
# Dir.rmdir("python")

["bin/hallo.py", "ola.lua", "/tmp/hej.cpp"].each do |filename|
  puts File.basename(filename, ".*")+".rb"
end
["bin/hallo.py", "ola.lua", "/tmp/hej.cpp"].each do |filename|
  puts File.basename(filename)+".rb"
end
["bin/hallo.py", "ola.lua", "/tmp/hej.cpp"].each do |filename|
  puts File.basename(filename, ".*")+"rb"
end

File.open("planets.txt", "w") do |f|
  f.puts(%w[Mercury Venus Earth Mars Jupiter Uranus Neptune])
end
f = File.open("planets.txt")
p f.readline("Earth")

p File.split("/home/john/bookmarks/")
p File.split("/home/john/bookmarks/").join

(1..31).each_slice(7) do |i|
  i.each {|n| printf("%2d%s", n, "\s") }
  print("\n")
end

string = "test code"
string.slice(0, 4)
p string
string.slice!(0,4)
p string

p 12354.chr(Encoding::UTF_8)
p 65.chr

obj = "dog"
obj2 = obj.dup
p obj.object_id
p obj2.object_id
p obj.equal?(obj2)

p ?b
# p ?333]

p 101.*(3)
p "foo\r\n".chomp
p "foo\n\r".chomp

puts("abcdefghijklmnopqrstuvwxyz".split(//, 5))

str = "foobarbaz\r\n\r\n"
p str.chomp
p str.chomp('')

hash = {:foo => 1, :bar => 2}
p hash.reject {|key, value| key == :foo }
p hash.find {|i| i.member?(:foo) }
p hash.dup
p hash.delete(:foo)
p hash

p 070
p "80".oct

p "abc-d-efg".split("-",2)

p File.basename("hoge.txt", ".*")
p "%2d%s"

a = 1,2,3
p a.to_s
p a.class
p a.join(",")

a = [1,2,3,4]
b = [1,3,5,7]
p a && b
p a & b

puts Time.now.strftime("%y-%m-%d %-H:%-M:%-S %r")
puts Time.now.strftime("%y-%m-%d %-H:%-M:%-S %p")
puts Time.now.strftime("%y-%m-%d %-H:%-M:%-S")

p Hash({})

hash = Hash.new(0)
p "a b c d e f g a".scan(/\w/) {|i| hash[i] += 1}
p hash

begin
  raise
  rescue
    p "例外です"
    p $!
  ensure
    p "ensureです"
end

p "he-llo".chomp("-")
p "he-llo-".chomp("-")

str = "string"
p str.slice(1,2)
p str.slice!(1,2)
p str

Dog = "main"
class Cat
  Dog = "foo"

  def self.foo
    ::Dog
  end
end

p Cat.foo

numbers = (1..20).to_a
p numbers.detect{|x| x % 5 == 0}
p numbers.find_all{|x| x % 5 == 0}

# x = 0
# def hoge3
#   (1...5).each do |i|
#     x += 1
#   end
#   puts x
# end
# hoge3

member = [1001111, "Tanaka", "Sato"]
p "ID:%2d Name:%s %s" % member

p Hash[:a, 1, :b, 2, :c, 3]

p "neww".match("^New|new")

a = "Ruby"
b = "Rails"
b = a
a.upcase!
p b

foo = [1, 2, 3]
bar = foo
bar[3] = 4
p foo
p bar
foo[4] = 5
p foo
p bar

puts("abc-def-ghijklmnopqrstuvwxyz".split(/-/,3))

hash = {:foo => 1, :bar => 2}
p hash.delete(:foo)

p Hash[]

p %s|apple banana orange|