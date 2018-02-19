require "minitest/autorun"

class MyClass
  def my_method(my_arg)
    my_arg * 2
  end

  private
  def hoge
    "hoge"
  end
end

class MyClass2
  define_method :my_method do |my_arg|
    my_arg * 3
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

  def test_03
    # sendを使うとprivateメソッドも呼び出せる
    assert_raises NoMethodError do
      @obj.hoge
    end
    assert_equal("hoge", @obj.send(:hoge))
  end

  def test_04
    # publicなメソッドにのみsendしたい場合はpublic_sendを使う
    assert_raises NoMethodError do
      @obj.public_send(:hoge)
    end
    assert_equal(2, @obj.public_send(:my_method, 1))
  end

  def test_05
    @obj = MyClass2.new
    assert_equal(3, @obj.my_method(1))
  end

end

