module Bar
  def bar
    :bar
  end
end

class Foo
  include Bar
end

Foo.new.bar # => :bar

class Baz
  extend Bar
end

Baz.bar # => :bar

module Bam
  include Bar
end

class Foot
  include Bam
end
