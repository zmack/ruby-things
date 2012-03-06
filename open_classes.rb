class Animal
  attr_accessor :feet
  def initialize(feet)
    self.feet = feet
  end
end

a = Animal.new(2)
a.feet # => 2

class Animal
  def feet
    @feet * 2
  end
end

a.feet # => 4

# 1.9.2+
a.method(:feet).source_location

# REE
a.method(:feet).__file__
a.method(:feet).__line__
