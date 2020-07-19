def bar(a:, b: 100, **z)
  p z
  p a + b
end

bar(a: 2, c: 100, d: 200)