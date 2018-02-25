require "minitest/autorun"
require "awesome_print"

$result = class MyClass
  100
end

class C
  def m1
    def m2

    end
  end
end

class D < C

end

class TestSample < Minitest::Test
  def setup
  end

  def test_01
    # クラス定義も最後の命令文の値を返す
    assert_equal(100, $result)
  end

  def test_02
    # m1を実行するとm2がCのインスタンスメソッドとして存在するようになる。
    obj = D.new
    assert_equal([:m1], C.instance_methods(false))
    obj.m1
    assert_equal([:m1, :m2], C.instance_methods(false))
  end
end

