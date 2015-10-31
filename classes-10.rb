class MyThing
  def self.last_instance
    @@last_instance
  end

  def initialize
    @@last_instance = self
    self
  end
end

class MyOtherThing < MyThing
end

p MyThing.new
p MyThing.last_instance
p MyOtherThing.last_instance
# => open_classes.rb
