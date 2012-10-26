class Bar < Exception
  def raise
    raise self
  end
end


raise Bar.new('What is love')
#
# => catch.rb
