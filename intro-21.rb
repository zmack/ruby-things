['an', 'array']
[1,2,3,4]
p [1,2,"foo", :bar]
%w(an array)

a = %w(foo bar baz)

for value in a
  puts value
end


a = [1,2,3,4,5]
b = [1,2,3,10]

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

# => intro-211.rb
