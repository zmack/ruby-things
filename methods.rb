# defining methods


def foo(bar)
  bar * 2
end

# optional returns, optional parens
# last value of the method gets returned, parens can be ommitted

foo(10) # => 20
foo 10  # => 20


def foo bar
  10
end


def foo(cal, vaca = 10, bar = 10)
  return :moo, :val if false
  return :cal
  bar * 2
end

def bar(cal:, vaca: 2, bar: 10)
  puts cal
  puts vaca
  puts bar
end

def other_method(value, is_true: true, print: false)
  if print_things
    puts value
  end

  if is_true
    !!value
  else
    !value
  end
end

a = 4

#if a == 3
  #p :foo
#elsif a == 2
  #p :bar
#else
  #p :moloz
#end

#case a
  #when 3
    #p :moloz
  #when 2
    #p :etc
  #else
    #p :bla
#end

#case a
#when Fixnum
  #puts "Fixnum"
#when String
  #puts "String"
#when Symbol
  #puts "Symbol"
#end

# puts "foo" unless (a == 3)

# => test/essentials_test.rb
# => classes.rb
