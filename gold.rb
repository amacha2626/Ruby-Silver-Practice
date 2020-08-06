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