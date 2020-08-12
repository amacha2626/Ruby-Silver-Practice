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
p Module.constants