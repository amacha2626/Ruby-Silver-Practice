p /a\db/ === "a3b"
p /a\db/ === "a3bd"
p /a(bc)*d/ === "abcbcd"
p /a(bc){2,4}d/ === "abcbcbcbcd"

%r|(http://www(\.)(.*)/)| =~ "http://www.xyz.org/"
%r|(http://www(\.)(.*)/)| =~ "http://www.abc.efd/"
p $0
p $1
p $2
p $3
p $4

p %r|(http://www(\.)(.*)/)| === "http://www.xyz./"

p /ruby/ === "RUBY"
p /ruby/i === "RUBY"
p /a.*b/ === "a\nb"
p /a.*b/m === "a\nb"

p `date +%Y/%m/%d`
p `date /T`

def foo
  throw :exit, 100
end

p catch(:exit) { 
  foo
  p 1
}
p 2

class Foo
  def initialize(a)
    @a = a
  end
  def method1
    @a
  end
end

foo1 = Foo.new(1)

def foo1.methodB
  @a += 1
end

p foo1.methodB
p foo1.singleton_class
p foo1.class

singleton_class = class << foo1
  self
end
p singleton_class


module M1
  def method1; "m1"; end
end

class C1
  prepend M1
  def method1; "c1"; end
end

class C2
  include M1
  def method1; "c2"; end
end

p C1.new.method1
p C2.new.method1

p C1.ancestors
p C2.ancestors

class C
  def foo
    p "C#foo"
  end

  def bar
    foo
  end
end

module M
  refine C do
    def foo
      p "C#foo in M"
    end
  end
end

C.new.foo
C.new.bar

using M

C.new.foo
C.new.bar

SomeClass = Class.new
p SomeClass.class
someclass = SomeClass.new
p someclass.class

class Class
  def c_method1
    1
  end
end

p C.c_method1
p String.c_method1
p Array.c_method1

class Bar
  def Bar.c_method2; 2; end
  def self.c_method3; 3; end
  class << self
    def c_method4; 4; end
  end
end
p Bar.c_method2
p Bar.c_method3
p Bar.c_method4

p "---------"

module M4
  def method1; 1; end
end

class C4
  include M4
  extend M4
end

p C4.method1
c4 = C4.new
p c4.method1

class Baz2
  def public_method1
    private_method1
  end
  def public_method2
    self.private_method1
  end
  private
  def private_method1; 100; end
end

p Baz2.new.public_method1
# p Baz2.new.public_method2

class Object
  def dog11
    p "dog"
  end

  private :dog11
end

dog11

i = 30
j = 40
f = Proc.new{ puts i+ j }
f.call
i = 60
f.call

f = Proc.new{|i| puts i}
3.times(&f)

# t = Thread.new do
#   p "start"
#   sleep 5
#   p "end"
# end
# p "wait"
# t.join

# 3.times do |i|
#   Thread.start(i) do |index|
#     p "thread-#{index} start"
#   end
# end
# sleep 1

# class MyClass
#   MYCONST = 1
#   p remove_const(:MYCONST)
#   p MYCONST
# end

module MyModule
  def self.included(object)
    p "#{object} has include #{self}"
  end

  def bar
    p "OK"
  end
  module_function :bar
end
class MyClass
  include MyModule
end

MyModule.bar

str = Marshal.dump({a: 1, b: 2, c: 3})
p str
p Marshal.load(str)

