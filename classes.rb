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
a.feet = 2 # Blow up
