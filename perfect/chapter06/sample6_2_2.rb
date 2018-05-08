class Klass
  @class_instance_val = :class_instance_val
  @@class_val = :class_val

  CONST_HOGE = "HOGE"

  def method1
    puts "A1: #{@class_instance_val}" # nil
    puts "A2: #{@@class_val}"
  end

  def method2
    puts "A3: #{CONST_HOGE}"
  end

  def method3
    puts "A4: #{@@class_val}"
  end

  def method4
    puts "A5: #{self.class.instance_variable_get(:@class_instance_val)}"
    puts "A6: #{self}"
  end
end

class Klass2 < Klass
  @class_instance_val = :hogehoge

  # def method4
  #   puts "A7: #{self.class.instance_variable_get(:@class_instance_val)}"
  #   puts "A8: #{self}"
  # end

  def method5
    puts "A9: #{self.class.instance_variable_get(:@class_instance_val)}"
    puts "A10: #{self}"
  end

  def method6
    puts "A11: call method3"
    method3
  end
end

k = Klass.new
k.method1
k.method2
puts "B1: #{Klass::CONST_HOGE}"
@@class_val = "OOPS" # Klass::CONST_HOGEを書き換えてしまう。(warningが出る)
k.method3
k.method4

k2 = Klass2.new
puts "-------->"
k2.method4
puts "-------->>"
k2.method5
k2.method6 # 書き換えたOOPSが出力される

puts "==============================="

class MyKlass
  @class_instance_val = :hoge

  def method1
    puts "C1: #{self}"
    puts "C2: #{self.class.instance_variable_get(:@class_instance_val)}"
    self.class.instance_variable_get(:@class_instance_val)
  end
end

class MyKlass2 < MyKlass
  @class_instance_val = :moge
end

class MyKlass3 < MyKlass

end

myklass_obj2 = MyKlass2.new
myklass_obj2.method1 # moge
myklass_obj3 = MyKlass3.new
puts myklass_obj3.method1().nil? # true
