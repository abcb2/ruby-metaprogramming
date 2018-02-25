require "minitest/autorun"
require "awesome_print"

class MyClass
  @my_var = 1

  def self.read
    @my_var
  end

  def write
    @my_var = 2
  end

  def read
    @my_var
  end
end

@@v = 100

class MyClass2
  @@v = 1
end

class D < MyClass2
  def my_method
    @@v
  end
end

def get_v
  @@v
end

class TestSample < Minitest::Test
  def setup
    @obj = MyClass.new
  end

  def test_01
    assert_equal(1, MyClass.read)
  end

  def test_02
    assert_nil(@obj.read)
  end

  def test_03
    @obj.write
    assert_equal(2, @obj.read)
    assert_equal(1, MyClass.read)
  end

  def test_04
    # クラス変数には妙な副作用？がある。
    # 100ではない
    # トップレベルでクラス変数にアクセスしないほうがよい。
    # トップレベルでアクセスしようとすると警告が出る
    assert_equal(1, get_v)
  end

  def test_05
    obj = D.new
    assert_equal(1, obj.my_method)
  end
end
