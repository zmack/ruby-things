require_relative 'test_deps'

class ArrayTest < MiniTest::Unit::TestCase
  def setup
    @a = %w(1 2 3 4 5 6 7).map(&:to_i)
    @b = (0..3).to_a
  end

  def test_truth
    assert_equal [1,2,3,4,5,6,7], @a
    assert_equal [0,1,2,3], @b
  end

  def test_summing_an_array
    assert_equal 28, @a
  end

  def test_selecting_odd_elements_of_an_array
    assert_equal [1,3,5,7], @a
  end
  
  def test_finding_first_element_divisible_by_2_and_3
    assert_equal 6, @a
  end

  def test_reversing_an_array
    assert_equal [7,5,3,1], @a
  end

  def test_intersection
    intersection = _

    assert_equal [1,2,3], intersection
  end

  def test_union
    union = _

    assert_equal [0,1,2,3,4,5,6,7], union
  end
end
