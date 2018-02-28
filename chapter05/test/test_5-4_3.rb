require "minitest/autorun"
require "awesome_print"

class C
  def a_method
    'C#a_method()'
  end
end

class D < C

end

class TestSample < Minitest::Test
  def setup
    @obj = D.new
    class << @obj
      def a_singleton_method
        'obj#a_singleton_method()'
      end
    end
  end

  def test_01
    assert_equal('C#a_method()', @obj.a_method)
  end

  def test_02
    assert_equal(D, @obj.class)
    # 特異クラスのスーパークラスはD
    assert_equal(D, @obj.singleton_class.superclass)
    assert_equal('obj#a_singleton_method()', @obj.a_singleton_method)
  end

  def test_03
    # 特異クラスとは、あるクラスのインスタンスがその裏に特別に持つ
    # メタクラス、シングルトンクラスのこと
    obj = C.new
    assert_equal(C, obj.singleton_class.superclass)
  end

end
