require 'minitest/autorun'
require 'minitest/reporters'
require 'simplecov'
Minitest::Reporters.use!
SimpleCov.start

require_relative 'todolist'

class TodoListTest < Minitest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_instance_variables
    assert_equal("Buy milk", @todo1.title)
    assert_equal(false, @todo1.done)
    assert_equal('', @todo1.description)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    assert_equal(@todo3, @list.pop)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done?
    assert_equal(false, @list.done?)
  end

  def test_add_raise_error
    assert_raises(TypeError) { @list.add(1) }
    assert_raises(TypeError) { @list.add("hi") }
  end

  def test_shovel
    new_todo = Todo.new("Test todo")
    @list << new_todo
    @todos << new_todo

    assert_equal(@todos, @list.to_a)
  end

  def test_add_alias
    new_todo = Todo.new("Test todo")
    @list.add(new_todo)
    @todos << new_todo

    assert_equal(@todos, @list.to_a)
  end

  def test_item_at
    assert_raises(IndexError) { @list.item_at(3) }
    assert_equal(@todo1, @list.item_at(0))
    assert_equal(@todo2, @list.item_at(1))
  end

  def test_mark_done_at
    assert_raises(IndexError) { @list.mark_done_at(100) }
    @list.mark_done_at(1)
    assert_equal(false, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(false, @todo3.done?)
  end

  def test_mark_undone_at
    assert_raises(IndexError) { @list.mark_undone_at(100) }
    @todo1.done!
    @todo2.done!
    @todo3.done!

    @list.mark_undone_at(1)

    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end

  def test_done!
    @list.done!
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_equal(true, @list.done?)
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(100) }
    removed_todo = @list.remove_at(1)
    assert_equal(@todo2, removed_todo)
    assert_equal([@todo1, @todo3], @list.to_a)
  end

  def test_to_s
    text = <<~TEXT
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    TEXT
    text.chomp!
    assert_equal(text, @list.to_s)
  end

  def test_to_s_with_marked_item
    @list.mark_done_at(1)
    text = <<~TEXT
    ---- Today's Todos ----
    [ ] Buy milk
    [X] Clean room
    [ ] Go to gym
    TEXT
    text.chomp!
    assert_equal(text, @list.to_s)
  end

  def test_to_s_with_all_done
    @list.done!
    text = <<~TEXT
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    TEXT
    text.chomp!
    assert_equal(text, @list.to_s)
  end

  def test_each
    counter = 0
    @list.each do |todo|
      assert_equal(@todos[counter], todo)
      counter += 1
    end

    # Launch school option
    result = []
    @list.each { |todo| result << todo }
    assert_equal(@todos, result)
  end

  def test_each_return_value
    returned_list = @list.each { |todo| nil }
    assert_same(returned_list, @list)

    # Launch school option
    assert_equal(@list, @list.each { |todo| nil })
  end

  def test_select
    @list.mark_done_at(1)
    new_list = @list.select { |todo| todo.done? }
    assert_equal([@todo2], new_list.to_a)

    # Launch school option
    new_list2 = TodoList.new(@list.title)
    new_list2.add(@todo2)
    
    assert_equal(new_list2.title, @list.title)
    assert_equal(new_list2.to_s, @list.select(& :done?).to_s)
  end
end