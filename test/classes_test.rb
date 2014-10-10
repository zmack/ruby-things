require_relative "test_deps"
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

class CaptiveBearTest < MiniTest::Unit::TestCase
  def test_there_are_captive_bears
    refute_nil CaptiveBear
  end

  def test_a_captive_bear_is_a_bear
    assert CaptiveBear < Bear, "Expected a CaptiveBear to be a Bear"
  end

  def test_a_captive_bear_has_size_and_color
    bear = CaptiveBear.new(:big, :brown)
    refute_nil bear
    assert_equal :big, bear.size
    assert_equal :brown, bear.color
  end

  def test_a_free_bear_can_be_made_captive
    bear = Bear.new(:big, :brown)
    captive_bear = CaptiveBear.capture(bear)
    assert_equal bear.size, captive_bear.size
    assert_equal bear.color, captive_bear.color
  end

  def test_bear_tracking_can_be_reset
    assert_respond_to CaptiveBear, :reset_tracking
    CaptiveBear.reset_tracking
    assert_equal 0, CaptiveBear.tracked_bears
  end

  def test_all_new_captive_bears_are_tracked
    CaptiveBear.reset_tracking
    CaptiveBear.new(:small, :brown)
    assert_equal 1, CaptiveBear.tracked_bears
    CaptiveBear.new(:big, :white)
    assert_equal 2, CaptiveBear.tracked_bears
  end

  def test_all_new_captive_bears_are_tracked
    CaptiveBear.reset_tracking
    CaptiveBear.new(:small, :brown)
    assert_equal 1, CaptiveBear.tracked_bears
    CaptiveBear.new(:big, :white)
    assert_equal 2, CaptiveBear.tracked_bears
  end
end
