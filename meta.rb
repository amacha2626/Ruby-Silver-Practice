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