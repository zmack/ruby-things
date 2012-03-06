require 'minitest/autorun'

class AwesomeTest < MiniTest::Unit::TestCase
  def test_this_works
    assert_equal 1, 1
  end

  def test_this_fails
    assert false, "Expected this to not suck"
  end

  def test_this_raises_something
    assert_raises NoMethodError do
      Date.foo
    end
  end
end
