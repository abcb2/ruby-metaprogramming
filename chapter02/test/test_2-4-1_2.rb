require "minitest/autorun"
require "pp"

module M1
end

module M2
  include M1
end

module M3
  prepend M1
  include M2
end

class TestSample < Minitest::Test
  def setup
  end

  def test_01
    # 多重インクルード
    # モジュールが既に継承チェーンに存在している場合は2回目の挿入は無視される
    # M3でprependされたM1はM2の中のincludeでは無視されている
    assert_equal([M1, M3, M2], M3.ancestors)
    assert_equal([M2, M1], M2.ancestors)
  end

  def test_02
    # KernelはModuleでObjectでincludeされている
    assert_equal(Module, Kernel.class)
    ancestors = Object.ancestors
    ancestors -= [PP::ObjectMixin, Minitest::Expectations] # Test用のチェーンを除く
    assert_equal([Object, Kernel, BasicObject], ancestors)
  end
end

