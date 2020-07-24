class Foo
  def initialize
    @hoge = 1
  end
end

f = Foo.new
p f.instance_variables
p f.instance_variable_get(:@hoge)
p f.instance_variable_set(:@hoge, 2)
p f.instance_variable_get(:@hoge)

p "-----------------"

class Bar
  def method_missing(name, *args)
    puts name
  end
end

bar = Bar.new
bar.hoge

p "------------------"

a = 1.2
p a.to_s
p a.inspect

class Hoge
  def initialize
    @foo = "bar"
  end
end

hoge = Hoge.new
p hoge.to_s
p hoge.inspect

p a = {"apple" => "fruit", "coffee" => "drink"}
p a.class

a = {a: "a", b: "b", c: "c"}
p a.fetch(5){|key| key % 2 == 0}

p a = {apple: "foods", coffee: "drink"}
p a.merge({coffee: "foods", orange: "fruit", tea: "drink"}){|key, self_val, other_val| self_val}
p a.merge({coffee: "foods", orange: "fruit", tea: "drink"}){|key, self_val, other_val| other_val}

a.each{|key, value| puts "#{key} => #{value}\n"}
a.each_pair{|key, value| puts "#{key} => #{value}\n"}

# p Symbol.all_symbols

IO.popen('grep -i ruby', 'r+') do |io|
  io.write('This is Ruby program')
  io.close_write
  puts io.read
end

p "-------------------"

p /(abc)d(efg)/ =~ "abcdefghijklmnopqrstuvwxyz"
p Regexp.last_match
p Regexp.last_match(0)
p $&
p $1

[1, 2, 3, 4, 5].inject(0) {|result, v| p result + v ** 2}
[1, 2, 3, 4, 5].inject(0) {|result, v| p v ** 2}

p "-------------------"

p a = [1 ,2, 3, 4, 5].lazy.select{|e| e % 2 == 0}
p b = a.map{|e| e * 2}
p c = a.take(3)
p c.to_a