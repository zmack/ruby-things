def foo
  yield
end

foo do
  "omg wtf"
end # => "omg wtf"

foo { "lolz" } # => "lolz"

def double_the_things
  yield * 2
end

double_the_things { "foo " } # => "foo foo "

def optional_block
  if block_given?
    yield
  else
    "I don't like you"
  end
end

optional_block # => "I don't like you"

optional_block { "Awesome" } # => "Awesome"

def block_as_param(&block)
  block.call * 2
end

block_as_param do
  30
end

def params_and_blocks(foo)
  foo * yield
end

params_and_blocks(30) do
  10
end # => 300


def can_yield_a_value
  yield 40
end

can_yield_a_value do |x|
  x == 40
end # => true

y = 20

can_yield_a_value do |x|
  y * 2 == x
end # => true
