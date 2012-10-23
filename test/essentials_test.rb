require 'minitest/unit'
require 'minitest/autorun'

class EssentialsTest < MiniTest::Unit::TestCase
  def test_some_assertions
    assert true
    refute false
  end

  def test_this_does_things
    assert_equal 1, 1
  end

  def test_string_interpolation
    a = 10
    assert_equal "10 pence", "??? pence"
  end

  def test_array_creation
    a = []
    assert_equal [1,2,3], a
  end

  def test_more_array_creation
    a = %w()
    assert_equal ["foo","bar", "baz"], a
  end

  def test_string_conversions
    a = "3 little pigs"
    assert_equal 3, a
  end

  def test_hashes
    a = {}
    assert_equal [:foo, :bar, "baz", []], a.keys
    assert_equal [1,2,3,4], a.values
  end

  def test_hash_creation
    a = Hash[]
    assert_equal({ :foo => 1, :bar => 2 }, a)
  end

  def test_more_hash_creation
    a = Hash.new()
    5000.times do |i|
      assert_equal :foo, a[i]
    end
  end

  def test_and_even_more_hash_creation
    a = Hash.new { |hash, key| }
    5000.times do |i|
      assert_equal :foo, a[i]
    end

    assert_equal :bar, a[:moloz]
  end

  def test_ranges
    a = ()

    assert a.include?(10)
  end

  def test_range_arrays
    a = (1..5)
    assert_equal [1,2,3,4,5], a
  end
end
