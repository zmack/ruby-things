class Foo
  def obvious_method
    "so obvious"
  end
end

class Bar < Foo
end

p Bar.new.obvious_method

# => classes-10.rb
