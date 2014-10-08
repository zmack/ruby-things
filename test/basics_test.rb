require_relative 'test_deps'

class BasicsTest < MiniTest::Unit::TestCase
  def test_assertions
    assert true
    refute false
  end

  def test_assert_equailty
    assert_equal 1, 1
  end

  def test_assert_variable_equality
    a = 1
    assert_equal 1, a
  end

  def test_defining_a_constant
    assert defined?(THIS_CONSTANT)
  end

  def test_defining_a_string
    a = _
    assert_equal String, a.class
  end

  def test_defining_a_symbol
    a = _
    assert_equal Symbol, a.class
  end

  def test_defining_a_fixnum
    a = _
    assert_equal Fixnum, a.class
  end

  def test_creating_a_multiline_string
    a = "foo bar baz"
    assert_equal 3, a.lines.count
  end

  def test_array_inclusion
    a = [1, 2, 3]

    assert_equal _, a.include?(1)
    assert_equal _, a.include?(4)
  end

  def test_array_operations
    a = [1, 2, 3]
    b = [2]

    assert_equal _, a | b
    assert_equal _, a & b
    assert_equal _, a + b
    assert_equal _, a - b
  end

  def test_truthy_values
    assert_equal _, truthy?(nil)
    assert_equal _, truthy?(0)
    assert_equal _, truthy?(1)
    assert_equal _, truthy?(true)
    assert_equal _, truthy?(false)
  end
end
