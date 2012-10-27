before = $:.dup

require 'rails'

p $: - before

b = []
a = b
b << 1
p a 
p b
