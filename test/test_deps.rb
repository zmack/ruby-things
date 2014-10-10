require 'minitest/unit'
require 'minitest/autorun'
require 'stringio'

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
