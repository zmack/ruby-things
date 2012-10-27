class Vaca

  def initialize
    @numar_picioare = 10
  end

  def bar
    @bar = 2
    self.moo
  end

protected
  def moo
    :bar
  end

private
  def uger
  end

end

a = Vaca.allocate
a = Vaca.new

p a.bar

p a.public_methods
p a.private_methods
p a.protected_methods


# => classes-2.rb
