require "minitest/autorun"
require "pp"

class MyClass
  def initialize
    @v = 1
  end
end

class C
  def initialize
    @x = 1
  end
end

class D
  def twisted_method
    @y = 2
    C.new.instance_eval {"@x: #{@x}, @y: #{@y}"}
  end

  def twisted_method2
    @y = 2
    C.new.instance_exec(@y) {|y| "@x: #{@x}, @y: #{y}"}
  end
end

class TestSample < Minitest::Test
  def setup
    @obj = MyClass.new
  end

  def test_01
    # instance_evalに渡したブロックを
    # コンテキスト探査機と呼ぶ
    v = 0
    _self = nil
    @obj.instance_eval do
      _self = self
      v = @v
    end
    assert_equal(1, v)
    assert_equal(MyClass, _self.class)
  end

  def test_02
    # instance_execを使ってブロックに引数を渡すことができる。
    d = D.new
    assert_equal("@x: 1, @y: ", d.twisted_method)
    assert_equal("@x: 1, @y: 2", d.twisted_method2)
  end
end

