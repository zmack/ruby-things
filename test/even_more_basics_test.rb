require_relative 'test_deps'

class EvenMoreBasicsTest < MiniTest::Unit::TestCase
  def test_define_an_array
    a = _

    refute_equal nil, a

    assert_equal nil, a[0]
    assert_equal 10, a[1]
    assert_equal "10", a[2]
    assert_equal :ten, a[3]
  end

  def test_define_a_hash
    a = _

    refute_equal nil, a

    assert_equal nil, a["zero"]
    assert_equal 10, a[:one]
    assert_equal "10", a[2]
    assert_equal :ten, a[[]]
  end

  def test_getting_keys_from_a_hash
    recipe = { :milk => 200, :eggs => 2, :beef => 10 }

    assert_equal [:milk, :eggs, :beef], recipe._
  end

  def test_getting_values_from_a_hash
    recipe = { :milk => 200, :eggs => 2, :beef => 10 }

    assert_equal [200, 2, 10], recipe._
  end

  def test_creating_a_range
    acceptable_prices_for_a_coffee = _

    assert_includes acceptable_prices_for_a_coffee, 1
    assert_includes acceptable_prices_for_a_coffee, 1.5
    assert_includes acceptable_prices_for_a_coffee, 1.75
    assert_includes acceptable_prices_for_a_coffee, 2.75
    assert_includes acceptable_prices_for_a_coffee, 3.75
    assert_includes acceptable_prices_for_a_coffee, 4.5
    refute_includes acceptable_prices_for_a_coffee, 5
  end
end
