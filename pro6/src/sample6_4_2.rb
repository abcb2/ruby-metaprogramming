module Hello
  def hello_from_module
    :hello_from_module
  end

  def hello
    :hello_by_module
  end
end

class Hoge
  include Hello
end

obj = Hoge.new
puts "A1: #{obj.hello_from_module}"
puts "A2: #{obj.class.ancestors}"

puts "*" * 20


class Moge
  include Hello

  def hello
    :hello_by_moge
  end
end
obj2 = Moge.new

puts "B1: #{obj2.hello == :hello_by_moge}"
puts "B2: #{obj2.class.ancestors}"

puts "*" * 20

class Foo
  prepend Hello

  def hello
    :hello_by_foo
  end
end

obj3 = Foo.new
puts "C1: #{obj3.hello == :hello_by_module}"
puts "C2: #{obj3.class.ancestors}"
