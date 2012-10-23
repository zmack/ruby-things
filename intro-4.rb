if true
  p :hello
else
  p :no_hello
end

p :hello if false

p :hello unless false

bar = 10 if false

p bar

a = if true
      10
    else
      11
    end
p a 

#a = (1..10)

#for i in a do
  #puts i
#end

#a.each do |i|
  #puts i
#end
# => methods.rb
