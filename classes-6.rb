class Animal
  attr_reader :feet

  def initialize(feet)
    @feet = feet
  end
end

a = Animal.new(2)
a.feet # => 2
a.feet = 2 # Blow up


# => test/basic_classes.rb
# => classes-7.rb
