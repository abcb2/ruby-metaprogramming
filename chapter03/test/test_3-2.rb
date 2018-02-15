require "minitest/autorun"

class MyClass
  def my_method(my_arg)
    my_arg * 2
  end
end

class TestSample < Minitest::Test
  def setup
    @obj = MyClass.new
  end

  def test_01
    assert_equal(6, @obj.my_method(3))
  end

  def test_02
    # コードの実行時にメソッドを決定する。
    # これを「動的ディスパッチ」という
    assert_equal(6, @obj.send(:my_method, 3))
  end

end

