require "minitest/autorun"

class MyClass
  def my_method
    puts "yes my_method"
  end
end

class TestSample < Minitest::Test
  def setup
    @obj1 = MyClass.new
    @obj2 = MyClass.new
  end

  def test_obj
    assert_equal(MyClass, @obj1.class)
  end

  def test_2_1
    # オブジェクトはメソッドを持っている
    assert_equal([:my_method], @obj1.methods.grep(/my/))
  end

  def test_2_2
    # 共通のクラスを持つオブジェクトはメソッドも共通している。
    # つまり、メソッドはオブジェクトでなくクラスに存在する
    assert_equal([:my_method], @obj2.methods.grep(/my/))
  end

  def test_3_1
    # しかしMyClassはmy_methodを持っているとは言えない
    # ゆえに「my_methodはMyClassのインスタンスメソッド」と呼ぶ
    assert_equal([], MyClass.methods.grep(/my/))
  end

  def test_3_2
    assert_equal(String.instance_methods, "abc".methods)
    assert_equal(false, String.methods == "abc".methods)
  end

  def test_3_3
    assert_equal(MyClass.instance_methods, @obj1.methods)
    assert_equal(MyClass.instance_methods(false), [:my_method])
  end

end

