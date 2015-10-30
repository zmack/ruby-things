require_relative 'test_deps'
require_relative '../code/secret_santa'

NAMES = %w(Alice Jim Bob Kenny Kelly Dog)

class SecretSantaTest < MiniTest::Unit::TestCase
  def setup
    @list = SecretSantaList.new(NAMES)
  rescue Exception
  end

  def test_there_is_a_list_class
    assert defined?(SecretSantaList), "SecretSantaList should be defined"
    assert SecretSantaTest.is_a?(Class), "SecretSantaList should be a class"
  end

  def test_list_takes_an_array_of_names
    refute_nil @list
  end

  def test_exposes_a_method_to_get_the_assignment_for_a_name
    assignment = @list.secret_santa_for("Alice")
    refute_nil assignment

    5.times do
      assert_equal @list.secret_santa_for("Alice"), assignment
    end
  end

  def test_a_person_cant_be_their_own_secret_santa
    5.times do
      @list = SecretSantaList.new(%w(Alice Bob))
      assert_equal "Bob", @list.secret_santa_for("Alice")
      assert_equal "Alice", @list.secret_santa_for("Bob")
    end
  end

  def test_one_person_can_only_be_a_secret_santa_for_one_other_person
    selected_santas = []
    NAMES.each do |name|
      refute_includes selected_santas, @list.secret_santa_for(name)
      selected_santas << @list.secret_santa_for(name)
    end
  end

  def test_adding_people_doesnt_change_the_assignments
    @list = SecretSantaList.new(NAMES)
    santas = NAMES.map { |name| @list.secret_santa_for(name) }

    @list.add_name("Satan")
    santas_after = NAMES.map { |name| @list.secret_santa_for(name) }
    assert_equal santas, santas_after
  end

  def test_adding_only_one_additional_name_assigns_the_new_entry_coal
    @list.add_name("Satan")
    assert_equal "**coal**", @list.secret_santa_for("Satan")
  end

  def test_adding_two_additional_names_assigns_them_to_each_other
    @list.add_name("Satan")
    @list.add_name("Bill Cosby")
    assert_equal "Bill Cosby", @list.secret_santa_for("Satan")
    assert_equal "Satan", @list.secret_santa_for("Bill Cosby")
  end
end

