require 'minitest/unit'
require 'minitest/autorun'
require_relative '../random_array.rb'

class RandomArrayTest < MiniTest::Unit::TestCase
  def setup
    @a = RandomArray.new
  end

end
