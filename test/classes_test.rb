require 'minitest/unit'
require 'minitest/autorun'
require_relative "../my_thing"

class BearTest < MiniTest::Unit::TestCase
  def test_a_bear_class_exists
    refute_nil Bear
  end

  def test_a_new_bear_takes_a_size
    bear = Bear.new(:big)
    refute_nil bear
  end

  def test_a_new_bear_can_also_take_a_color
    bear = Bear.new(:big, :brown)
    refute_nil bear
  end
end

class BigBrownBearTest < MiniTest::Unit::TestCase
  def setup
    @bear = Bear.new(:big, :brown)
  end

  def test_bears_expose_their_size
    assert_equal :big, @bear.size
  end

  def test_bears_expose_their_color
    assert_equal :brown, @bear.color
  end

  def test_a_bears_size_cannot_be_changed
    refute_respond_to @bear, :size=
  end

  def test_a_bears_color_can_be_changed
    assert_respond_to @bear, :color=
    @bear.color = :pink
    assert_equal :pink, @bear.color
  end
end
