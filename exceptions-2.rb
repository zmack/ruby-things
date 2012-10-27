class Bar
  def raise
    raise self
  end
end


raise Bar.new
#
# => catch.rb
