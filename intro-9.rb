# Range
# http://ruby-doc.org/core-2.2.0/Range.html

p (1..10).include?(3) # range

a = (1..3)

for value in a
  puts value
end


p (-1..-5).to_a      #=> []
p (-5..-1).to_a      #=> [-5, -4, -3, -2, -1]
p ('a'..'e').to_a    #=> ["a", "b", "c", "d", "e"]
p ('a'...'e').to_a   #=> ["a", "b", "c", "d"]


# => intro-10.rb
