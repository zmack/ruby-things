# Hash
# http://ruby-doc.org/core-2.2.0/Hash.html

a = { :foo => "bar" } # a hash

a["foo"] = :bar
a[1] = Fixnum
a[Fixnum] = 1

p 1.class

p a.keys
p a.values

p "Pretty display:"
for key, value in a
  puts "#{key}(#{key.class}) -> #{value}"
end

# => intro-9.rb
