require_relative 'test_deps'
require_relative '../code/todo_list'

class TodoTest < MiniTest::Unit::TestCase
  def test_there_should_be_a_todo_class
    assert defined?(TodoItem), "A TodoItem class should exist"
  end

  def test_the_todo_class_should_take_a_description
    item = TodoItem.new("Get Milk And Cookies")
    refute_nil item
  end

  def test_the_todo_class_should_have_a_getter_for_its_done_state
    item = TodoItem.new("Get Milk And Cookies")

    refute item.done?, "Items should not be done by default"
  end

  def test_the_todo_class_can_be_initialized_to_done
    item = TodoItem.new("Do the thing", true)

    assert item.done?, "This particular item, however, should be done"
  end

  def test_a_todo_can_be_set_to_done
    item = TodoItem.new("Do the thing")
    refute item.done?, "Item should not be done"

    item.done!

    assert item.done?, "Item should be done"
  end

  def test_a_todo_can_get_its_description
    item = TodoItem.new("Do the thing")
    assert_equal "Do the thing", item.description
  end

  def test_a_todo_can_set_its_description_after_creation
    item = TodoItem.new("Do the thing")
    assert_equal "Do the thing", item.description

    item.description = "Flex muscles"
    assert_equal "Flex muscles", item.description
  end
end

class TodoListTest < MiniTest::Unit::TestCase
  def test_there_should_be_a_todo_class
    assert defined?(TodoListTest), "A TodoList class should exist"
  end

  def test_a_todo_list_should_have_a_name
    todo_list = TodoList.new("Really gross things I have to wash")
    assert_equal "Really gross things I have to wash", todo_list.name
  end

  def test_a_todo_list_should_have_a_color
    todo_list = TodoList.new("Pokemon to collect", :color => :red)
    assert_equal :red, todo_list.color
  end

  def test_should_be_able_to_add_a_todo_to_a_list
    todo_list = TodoList.new("Pokemon to collect", :color => :red)

    todo_list.add(TodoItem.new("Charizard"))

    assert_equal 1, todo_list.items.length
  end

  def test_should_be_able_to_add_a_todo_to_a_list_via_a_string
    todo_list = TodoList.new("Pokemon to collect", :color => :red)

    todo_list.add("Charizard")

    assert_equal 1, todo_list.items.length
  end

  def test_should_be_able_to_get_a_list_of_tasks_pending
    todo_list = TodoList.new("Pokemon to collect", :color => :red)

    todo_list.add("Charizard")

    assert_equal 1, todo_list.items_pending.length
  end

  def test_should_be_able_to_get_a_list_of_tasks_done
    todo_list = TodoList.new("Pokemon to collect", :color => :red)

    todo_list.add(TodoItem.new("Charizard", true))

    assert_equal 1, todo_list.items_done.length
  end

  def test_should_be_able_to_get_a_task_by_description
    todo_list = TodoList.new("Pokemon to collect", :color => :red)

    todo_list.add("Charizard")

    refute_nil todo_list.find_by_description("Charizard")
  end

  def test_should_have_a_method_that_sets_a_task_as_done_by_description
    todo_list = TodoList.new("Pokemon to collect", :color => :red)
    item = TodoItem.new("Charizard")
    todo_list.add(item)

    assert todo_list.set_as_done("Charizard"), "Should return true when the task is found"
    assert item.done?, "Task should be set as done"
  end
end
