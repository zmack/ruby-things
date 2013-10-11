1 # an integer
# p 1.public_methods

MOLOZ = 123
p MOLOZ.to_s
:foo # a symbol
#foo
p :foo.to_s

# Strings get allocated each time
p "foo".object_id
p "foo".object_id
p "foo".object_id

# Symbols do not
p :foo.object_id
p :foo.object_id
p :foo.object_id

p 1.to_s.to_sym.public_methods

p "123foo".to_i
p "foo123".to_i

# => intro-21.rb
