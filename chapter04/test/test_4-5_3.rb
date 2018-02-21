require "minitest/autorun"
require "pp"

class MyClass
  def initialize(val)
    @x = val
  end

  def my_method
    @x
  end
end

module MyModule
  def my_method
    42
  end
end

class TestSample < Minitest::Test
  def setup
    @obj = MyClass.new(1)
  end

  def test_01
    m = @obj.method :my_method
    assert_equal(Method, m.class)
    assert_equal(1, m.call)
  end

  def test_02
    # 元のクラスやモジュールから引き剥がされたメソッドがUnboundMethod
    # unboundされたメソッドは元のクラスと同じクラス(またはサブクラス)
    # のオブジェクトであればbindできる
    unbound = MyModule.instance_method(:my_method)
    assert_equal(UnboundMethod, unbound.class)
    String.send :define_method, :hogehoge, unbound
    assert_equal(42, "abc".hogehoge)
  end
end
