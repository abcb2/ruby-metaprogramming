require "minitest/autorun"
require "pp"

module M1
  def my_method
    'M1#my_method()'
  end
end

module M2

end

class C
  include M1
end

class C2
  prepend M2
end

class D < C
end

class D2 < C2

end

class TestSample < Minitest::Test
  def setup
  end

  def test_01
    # テスト用のモジュールは削除する
    ancestors = D.ancestors
    ancestors -= [PP::ObjectMixin, Minitest::Expectations]
    assert_equal([D, C, M1, Object, Kernel, BasicObject], ancestors)
  end

end

