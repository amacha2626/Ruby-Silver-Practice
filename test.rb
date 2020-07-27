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