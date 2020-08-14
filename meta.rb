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
