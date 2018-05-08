class BaseClass
  def hello
    :hello
  end
end

base_obj = BaseClass.new
puts "A1: #{base_obj.hello}"
puts "A1-2: #{base_obj.class.ancestors}"

puts "*" * 20

class InheritClass < BaseClass
end

inherit_obj = InheritClass.new
puts "B1: #{inherit_obj.hello}"
puts "B1-2 #{inherit_obj.class.ancestors}"

puts "*" * 20

def base_obj.hello
  :singleton_method_hello
end

class << base_obj
  def hello2
    :singleton_method_hello2
  end
end

# BaseClassより先に特異クラスで定義したhelloメソッドが呼ばれる
puts "C1: #{base_obj.hello == :singleton_method_hello}"
puts "C2: #{base_obj.hello2 == :singleton_method_hello2}"
puts "C3: #{base_obj.singleton_class.ancestors}"

puts "*" * 20