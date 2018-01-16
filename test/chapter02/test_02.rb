require "minitest/autorun"

=begin

  - メソッド探索
    includeはモジュールをクラスの継承チェーンに挿入する

=end

module Foo
  def foo_method
  end
end

class MyClass
  include Foo
end

class YourClass

end

class TestSample < Minitest::Test
  def setup
    @obj0 = YourClass.new
    @obj1 = MyClass.new
  end

  def test_ancestors_01
    assert_equal(
      [
        YourClass, Object, Minitest::Expectations, Kernel, BasicObject
      ],
      @obj0.class.ancestors
    )
  end

  def test_ancestors_02
    assert_equal(
      [
        MyClass, Foo, Object, Minitest::Expectations, Kernel, BasicObject
      ],
      @obj1.class.ancestors
    )
  end

end
