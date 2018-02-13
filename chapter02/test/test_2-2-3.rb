require "minitest/autorun"
require "pp"

class MyClass
  def my_method
    puts "yes my_method"
  end
end

ROOT_CONST = 'root const'

module M
  class C
    X = 'Constant A'

    def root_const
      ::ROOT_CONST
    end
  end
end

module M
  Y = 'Constant in M'
end

module Nesting
  class C
    module M
      # pp Module.nesting
    end
  end
end


class TestSample < Minitest::Test
  def setup
    @obj1 = MyClass.new
    @obj2 = MyClass.new
  end

  def test_01
    # クラスの参照を変数に保持できる
    myclass = MyClass
    assert_equal(MyClass, myclass)
    assert_equal(MyClass, myclass.new.class)
  end

  def test_02
    # 大文字で始まる参照はクラス名やモジュール名も含めてすべて定数
    # 定数はファイルシステムのようなパスでアクセスすることができる。

    assert_equal('Constant A', M::C::X)
    c_class = M::C
    assert_equal(M::C::X, c_class::X)
  end

  def test_03
    # ルートレベルのアクセスには'::'でアクセスする
    assert_equal('root const', ::ROOT_CONST)
    assert_equal(::ROOT_CONST, M::C.new.root_const)
  end

  def test_04
    # Module#constantsは現在のスコープにある定数を返す
    # lsコマンドと同等と考えるとよい
    assert_equal([:C, :Y], M.constants.sort)
    assert_equal([:X], M::C.constants)
  end

  def test_05
    # Nesting::C::MのModule.nestingで
    # [Nesting::C::M, Nesting::C, Nesting]
    # という返り値が得られる
  end
end

