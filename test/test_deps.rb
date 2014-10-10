require 'minitest/unit'
require 'minitest/autorun'
require 'stringio'

class MiniTest::Unit::TestCase
  def _
    flunk "Replace _ with an actual value"
  end

  def truthy?(value)
    !!value
  end

  def assert_print(expected)
    temp_io = StringIO.new

    $stdout = temp_io

    yield

    temp_io.rewind
    result = temp_io.read

    assert_equal expected, result.strip

  ensure
    $stdout = STDOUT
  end

  alias :old_run_test :run_test

  def run_test(*args)
    old_run_test(*args)
  rescue ErrUnderscore => e
    ex = MiniTest::Assertion.new("Replace _ with a method call")
    ex.set_backtrace(e.backtrace)

    raise ex
  end
end

class MiniTest::Unit
  def location e # :nodoc:
    last_before_assertion = ""
    clean_bt = e.backtrace.reverse_each.take_while do |s|
      !(s =~ /in .(assert|refute|flunk|pass|fail|raise|must|wont)/)
    end

    if clean_bt[-1] =~ /test_deps.rb/
      last_before_assertion = clean_bt[-2]
    else
      last_before_assertion = clean_bt[-1]
    end

    last_before_assertion.sub(/:in .*$/, '')
  end
end

class ErrUnderscore < StandardError; end

class Object
  def _
    raise ErrUnderscore
  end
end
