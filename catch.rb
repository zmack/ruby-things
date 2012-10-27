class Bars
  def foo
    p "Hi"
    throw :bum
  end
end

catch(:bum) do
  Bars.new.foo
end

# => hooks.rb ? =[
