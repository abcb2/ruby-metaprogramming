require "minitest/autorun"

=begin

  - メソッド探索
    - includeはモジュールをクラスの継承チェーンに挿入する
    - ruby2.0からはprependも追加された

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

class PrependClass
  prepend Foo
end

class TestSample < Minitest::Test
  def setup
    @obj1 = YourClass.new
    @obj2 = MyClass.new
    @obj3 = PrependClass.new
  end

  def test_ancestors_01
    assert_equal(
      [
        YourClass, Object, Minitest::Expectations, Kernel, BasicObject
      ],
      @obj1.class.ancestors
    )
  end

  def test_ancestors_02
    assert_equal(
      [
        MyClass, Foo, Object, Minitest::Expectations, Kernel, BasicObject
      ],
      @obj2.class.ancestors
    )
  end

  def test_ancestors_03
    assert_equal(
      [
        Foo, PrependClass, Object, Minitest::Expectations, Kernel, BasicObject
      ],
      @obj3.class.ancestors
    )
  end
end
