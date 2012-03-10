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


def foo(bar = 10)
  bar * 2
end

p foo # => 20

# => classes.rb
