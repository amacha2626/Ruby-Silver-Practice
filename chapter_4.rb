class Foo
  def initialize(a)
    @a = a
  end
  def method1
    @a
  end
end

foo1 = Foo.new(1)
foo2 = Foo.new(2)
p foo1.method1
p foo2.method1

p "-------------"

class FooExt < Foo
  def initialize(a, b)
    @b = b
    super a
  end
  def method2(c)
    @a + @b + c
  end
end

fooExt = FooExt.new(3, 4)
p fooExt.method1
p fooExt.method2(5)

p FooExt.class
p FooExt.superclass

p foo1.instance_variables
p fooExt.instance_variables

p "--------------"

class Hoge
  def method_missing(m, *args)
    p "called: " + m.to_s
    super
  end
end

# Hoge.new.no_method

module Bar
  def methodA
    1
  end
end

class FooExt < Foo
  include Bar
end

fooExt = FooExt.new(3, 4)
p fooExt.methodA