# arrays - operations
a = [1, 2, 3, 4, 5]
b = [1, 2, 3, 10]

p a + b
p a - b
p a & b
p a | b
p a.include?(1)
p a.include?(10)

a.push(10)
p a
a.pop
p a

a.unshift(10)
p a
p a.shift
p a

# => test/basics_test.rb
# => intro-8.rb