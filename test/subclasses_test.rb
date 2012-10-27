require 'minitest/unit'
require 'minitest/autorun'
require_relative "../my_thing"

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
end
