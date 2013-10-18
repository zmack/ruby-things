class Animal
  attr_accessor :feet
  def initialize(feet)
    self.feet = feet
  end

  def foo
    :bar
  end
end

a = Animal.new(2)
a.feet # => 2

class Animal
  def feet
    @feet * 2
  end
end

class Fixnum
  def capra
    :foo
  end
end

p 1.capra
a.feet # => 4

p a.method(:feet).source_location # => [file, line]

# => test/classes_test.rb
# => blocks.rb
