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

  def method_missing(method, *args)
    puts "C3: oops -> #{method} #{args}"
  end
end

obj3 = Foo.new
puts "C1: #{obj3.hello == :hello_by_module}"
puts "C2: #{obj3.class.ancestors}"
obj3.missing
puts "*" * 20

module HelloModule
  def hello
    :hello_module
  end
end

class GrandParentClass
  def hello
    :grand_parent_hello
  end
end

class ParentClass < GrandParentClass
  include HelloModule
end

class ChildClass < ParentClass
end

child = ChildClass.new
puts "D1: #{child.hello == :hello_module}"
puts "D2: #{child.class.ancestors}"

puts "*" * 20
module Yes
  def yes
    :yes
  end

  def super_call(symbol = nil)
    super(:by_module)
  end
end

class MyYES
  prepend Yes

  def yes
    :myyes
  end

  def super_call(symbol)
    "#{:super_call}-#{symbol}"
  end
end

myyes = MyYES.new
puts "E1: #{myyes.yes == :yes}"
puts "E2: #{myyes.super_call(nil) == 'super_call-by_module'}"
