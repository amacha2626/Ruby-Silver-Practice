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