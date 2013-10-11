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
    lay_an_egg
    self.lay_an_egg
  end

private
  def wings=(value)
    @wings = value
  end

  def lay_an_egg
    "egg :'("
  end
end

a = Duck.new(a)
a = Duck.allocate
p a.swim
p a.wings
a.send(:initialize, 5)
p a.wings

# => open_classes.rb
