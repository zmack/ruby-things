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

# => classes-9.rb
