require "minitest/autorun"
require "pp"

module M1
  def my_method
    'M1#my_method()'
  end
end

class C
  include M1
end

class D < C
end

module M2
end

class C2
  prepend M2
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

  def test_02
    # prependしたmoduleは継承チェーンがincludeより手前になる
    ancestors = D2.ancestors
    ancestors -= [PP::ObjectMixin, Minitest::Expectations]
    assert_equal([D2, M2, C2, Object, Kernel, BasicObject], ancestors)
  end

end

