module M
  class C
    X = "dog"
  end
  p C::X
end

p M::C::X

Y = "cat"
module M
  Y = "dog"
  p Y
  p ::Y
end

p M.constants
# p Module.constants

module M
  class C
    module M2
      p Module.nesting
    end
  end
end

class MyClass
  define_method :my_method do |my_arg|
    my_arg * 3
  end
end

obj = MyClass.new
p obj.my_method(2)

class Roulette
  def method_missing(name, *args)
    person = name.to_s.capitalize
    super unless %w[Bob Frank Bill].include? person
    number = 0
    3.times do
      number = rand(10) + 1
      puts "#{number}..."
    end
    "#{person} got a #{number}"
  end
end

number_of = Roulette.new
puts number_of.bob
puts number_of.frank


class Foo
  def bar; end;
end

foo = Foo.new
p foo.respond_to?(:bar)
p foo.respond_to?(:buz)
p number_of.respond_to?(:bob)

dog = "one"
def cat
  "meow"
end

p cat
p dog.class

my_var = "成功"
MyClass2 = Class.new do
  puts "クラス定義の中は#{my_var}"

  define_method :my_method do
    "メソッド定義の中も#{my_var}"
  end
end

puts MyClass2.new.my_method

module MyModule
  def my_method
    42
  end
end

unbound = MyModule.instance_method(:my_method)
p unbound.class

String.send :define_method, :another_method, unbound
p "abc".another_method

p self
p self.class

class C
  def m1
    def m2; self; end;
  end
end

class D < C; end

obj = D.new
p obj.m1
p C.instance_methods(false)

def add_method_to(a_class)
  p self
  # main
  a_class.class_eval do
    p self
    # String
    def m; self; end # "abc"
  end
end

add_method_to String
p "abc".m

c = Class.new(Array) do
  def my_method
    "Hello"
  end
end

MyClass3 = c
p c.name
p MyClass3.new.my_method

str = "hello, world"
def str.title?
  self.upcase == self
end

p str.title?
p str.methods.grep(/title?/)
p str.singleton_methods

class Dog
  def self.hoge; end;
end

def Dog.fuga; end

p Dog.singleton_methods

class AttrClass
  attr_accessor :my_attribute 
end

atr = AttrClass.new
atr.my_attribute = "abc"
p atr.my_attribute

obj = Object.new
singleton_class = class << obj
  self
end

p singleton_class.class
p "abc".singleton_class

class C
  def a_method
    'C#a_method()'
  end
end

class D < C; end
obj = D.new
p obj.a_method
p obj.singleton_class
p obj.singleton_class.superclass

class << obj
  def a_singleton_method
    'obj#a_singleton_method()'
  end
end

def obj.b_singleton_method; end;

p obj.singleton_methods
p obj.singleton_class

class C
  class << self
    def a_class_method
      'C.a_class_method()'
    end
  end
end

p C.singleton_class
p C.superclass
p D.singleton_class
p D.singleton_class.superclass
p C.singleton_class.superclass
p C.singleton_class.superclass.superclass
p C.singleton_class.superclass.superclass.superclass

p D.a_class_method

s1, s2 = "abc", "def"

s1.instance_eval do
  def swoosh!; reverse; end
end

p s1.swoosh!
p s2.respond_to? :swoosh!

class MyClass
  class << self
    attr_accessor :c
  end
end

MyClass.c = "It works!"
p MyClass.c

def MyClass.d=(value)
  @d = value
end

def MyClass.d
  @d
end

MyClass.d = "hello"
p MyClass.d

p MyClass.d.class

p MyClass.singleton_methods

# module MyModule2
#   def self.my_method; "hello"; end
# end

# class MyClass
#   include MyModule2
# end

# p MyClass.my_method

module MyModule2
  def my_method; "hello"; end
end

class MyClass
  class << self
    include MyModule2
  end
end

p MyClass.my_method

obj = Object.new

# class << obj
#   include MyModule2
# end

obj.extend MyModule2

p obj.my_method
p obj.singleton_methods

class MyClass
  def my_method; "my_method()"; end
  alias_method :m, :my_method
end

obj = MyClass.new
p obj.my_method
p obj.m

class String
  alias_method :real_length, :length

  def length
    real_length > 5 ? "long" : "short"
  end
end

p "war and peace".length
p "war and peace".real_length

require 'uri'

p URI.encode_www_form_component("技術者試験対策")
uri = URI.encode_www_form_component("技術者試験対策")
p URI.decode_www_form_component(uri)
p URI.decode_www_form_component(uri).class

p 4/5r
p 4/5r.to_f

def hoge(*args)
  p args
  p *args
  p args[0]
end
hoge [1,2,3]

def hoge(x:,y: 2, **params)
  p "#{x},#{y},#{params[:z]}"
end
hoge(x: 1, z: 3)

class Cls1
  def Cls1.foo
    puts "Cls1"
  end
end
class Cls2 < Cls1
  def foo
    puts "Cls2"
  end
end
Cls2.foo
p Cls2.singleton_methods

module M
  def foo
    self.class
  end
end
class C
  include M
end
p C.new.foo

p [1, 2, 3].inject{|x, y| x + y ** 2 }
p [1, 2, 3].inject([]){|x, y| x << y ** 2 }

p (1..Float::INFINITY).lazy.map{|x|x**2}.take(3).inject(0, &:+)
p [1,2,3,4,5].inject(0, &:+)

f = Fiber.new do
  Fiber.yield "foo"
  :dog
end
p f.resume
p f.resume

a, b = [1, 2]
p a
p b

x = ["abc", "defgh", "lopq"]
p x.sort{|a, b| b.size <=> a.size}
p x.sort{|a, b| a.size <=> b.size}
p x.sort{|a, b| a.size - b.size}
p x.sort{|a, b| a <=> b}

d1 = Time.new
d2 = Time.new
p (d1 - d2).class

module Mod
  def Mod.foo
    p "Mod"
  end
end

class Cls3
  include Mod
end

# Cls3.foo
Mod.foo

class C
  @val = 3
  attr_accessor :val
  class << self
    @val = 10
  end
  def initialize
    @val *= 2 if val
  end
end

c = C.new

p c.val

p $_

class C
  def self.m1
    200
  end
end

module R
  refine C do
    def self.m1
      100
    end
  end
end

using R

puts C.m1

class Human
  NAME = "Unknown"

  def Human.name
    const_get(:NAME)
  end
end

class Fukuzawa < Human
  NAME = "Yukichi"
end

puts Fukuzawa.name
p Fukuzawa.singleton_methods
p Fukuzawa::NAME

class String
  alias_method :hoge, :reverse
end

p "12345".hoge

p ['a' ,'b'].map(&:upcase)

def hoge(*args, &block)
  block.call(args)
end

hoge(1,2,3,4) do |*args|
  p args.length < 0 ? "hello" : args
end
hoge(1,2,3,4) do |args|
  p args.length < 0 ? "hello" : args
end

p !!!true

v1 = 1 / 2 == 0
v2 = !!v1 or raise RuntimeError
# v2 = !!v1 || (raise RuntimeError)
puts v2 and false

class Company
  attr_reader :id
  attr_accessor :name
  def initialize id, name
    @id = id
    @name = name
  end
  def to_s
    "#{id}:#{name}"
  end
  def <=> other
    other.id <=> self.id
  end
end

companies = []
companies << Company.new(2, 'Liberyfish')
companies << Company.new(3, 'Freefish')
companies << Company.new(1, 'Freedomfish')

companies.sort!

companies.each do |e|
  puts e
end

p "a".succ

class Array
  def succ_each(step = 1)
    return to_enum(__method__, step) unless block_given?

    each do |int|
      yield int + step
    end
  end
end

[97, 98, 99].succ_each.map {|int|
  p int.chr
}
p [97, 98, 99].succ_each.map

class C
  CONST = "Good, night"
end

module M
  CONST = "Good, evening"
end

module M
  class C
    CONST = "Hello, world"
  end
end

module M
  class ::C
    p CONST
  end
end

module M
  class M::C
    p CONST
  end
end

m = Module.new

CONST = "Constant in Toplevel"

_proc = Proc.new do
  CONST = "Constant in Proc"
end

m.instance_eval(<<-EOS)
  CONST = "Constant in Module instance"

  def const
    CONST
  end
EOS

p m.module_eval(&_proc)
p m.const

module M
  extend self
  def a
    100
  end
end

p M.a

class Dog
  def name
    "pochi"
  end

  def name
    # super
    "tama"
  end
end

p Dog.new.name

module M
  CONST1 = "Hello, world"
  class C
    def awesome_method
      CONST1
    end
  end
end

# class M::C
#   def awesome_method
#     CONST1
#   end
# end

p M::C.new.awesome_method

