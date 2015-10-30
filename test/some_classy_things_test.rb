require_relative 'test_deps'
require_relative '../code/classy_things'

class FoodTest < MiniTest::Unit::TestCase
  def test_there_is_a_food_class
    assert defined?(Food), "Food should be defined"
    assert Food.is_a?(Class), "Food should be a class"
  end

  def test_foods_have_a_constructor_that_takes_weight_and_calories_per_100_grams
    food = Food.new(100, 98)
    refute_nil food
  end

  def test_foods_initializer_takes_an_optional_hash
    food = Food.new(100, 98, { :color => :red })
    refute_nil food
  end

  def test_foods_expose_a_getter_for_grams_total_calories_and_color
    food = Food.new(100, 98, { :color => :red })

    assert_equal :red, food.color
    assert_equal 100, food.grams
  end

  def test_foods_return_total_calories
    food = Food.new(100, 98, { :color => :red })
    assert_equal 98, food.calories

    food = Food.new(110, 98, { :color => :red })
    assert_equal 107, food.calories
  end

  def test_foods_have_a_description
    food = Food.new(100, 98, { :color => :red })

    assert_equal "100 grams of some weird red goop", food.description
  end
end

class TomatoTest < MiniTest::Unit::TestCase
  def test_there_is_an_actual_tomato_class
    assert defined?(Tomato), "Tomato class should be defined"
  end

  def test_tomatoes_can_just_be_initialized_by_weight
    tomatoes = Tomato.new(200)
    refute_nil tomatoes
  end

  def test_tomatoes_still_expose_calories_and_color
    tomatoes = Tomato.new(100)

    assert_equal 18, tomatoes.calories
    assert_equal 100, tomatoes.grams
    assert_equal :red, tomatoes.color
  end

  def test_tomatoes_define_a_static_method_that_returns_the_plural
    assert_equal "tomatoes", Tomato.plural
  end

  def test_tomatoes_description_is_way_more_appealing
    tomatoes = Tomato.new(200)

    assert_equal "200 grams of the most awesome red tomatoes ever", tomatoes.description
  end
end

class CherryTest < MiniTest::Unit::TestCase
  def test_there_is_an_actual_cherry_class
    assert defined?(Cherry), "cherry class should be defined"
  end

  def test_cherries_can_just_be_initialized_by_weight
    cherries = Cherry.new(200)
    refute_nil cherries
  end

  def test_cherries_still_expose_calories_and_color
    cherries = Cherry.new(100)

    assert_equal 50, cherries.calories
    assert_equal 100, cherries.grams
    assert_equal :red, cherries.color
  end

  def test_cherries_define_a_static_method_that_returns_the_plural
    assert_equal "cherries", Cherry.plural
  end

  def test_cherries_description_is_way_more_appealing
    cherries = Cherry.new(200)

    assert_equal "200 grams of the most awesome red cherries ever", cherries.description
  end
end
