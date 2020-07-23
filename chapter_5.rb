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

