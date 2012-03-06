class Foo
  def bar
    "omg!"
  end
end

Foo.new.bar # => "omg!"

class Baz
  def self.bar
    "wtf"
  end
end

Baz.bar # => "wtf"

class Animal
  def initialize(heads)
    @heads = heads
  end

  def heads; @heads; end
end

Animal.new(2).heads # => 2

class Animal
  def self.new_from_rat(rat)
    self.new(1)
  end
  
  def initialize(heads)
    @heads = heads
  end

  def heads; @heads; end
end

Animal.new_from_rat(nil).heads # => 2

# accessors :o

class Moose
  def horns=(value)
    @horns = value
  end

  def horns
    @horns
  end
end


class Animal
  attr_accessor :heads

  def initialize(heads)
    self.heads = heads
  end
end

a = Animal.new(2)
a.heads # => 2
a.heads = 3
a.heads # => 3

class Animal
  attr_reader :feet

  def initialize(feet)
    @feet = feet
  end
end

a = Animal.new(2)
a.feet # => 2
# a.feet = 2 # Blow up


# methods vs variables
class Goat
  attr_accessor :feet

  def set_feet(other)
    feet = other
  end

  def set_more_feet(other)
    self.feet = other
  end
end

a = Goat.new
a.set_feet(2)
a.feet # => nil

a.set_more_feet(2)
a.feet # => 2

a.feet = 3
a.feet # => 3

# Visibility

class Duck
  def initialize(wings)
    @wings = wings
  end

  def set_wings(value)
    self.wings = value
  end

  def wings
    @wings
  end

  def swim
    pee
    self.pee
  end

private
  def wings=(value)
    @wings = value
  end

  def pee
    "omg duck pee"
  end
end
