
=begin

  p.17 2.2.1インスタンス変数

  rubyのオブジェクトのクラスとインスタンス変数の間には何のつながりもない
  インスタンス変数は値が代入されたときにはじめて出現する

=end

class MyClass
  def my_method
    @v = 1
  end
end

obj1 = MyClass.new
obj1.my_method
puts obj1.instance_variables.count() # 1

obj2 = MyClass.new
puts obj2.instance_variables.count() # 0