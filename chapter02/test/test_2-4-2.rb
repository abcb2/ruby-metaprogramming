require "minitest/autorun"
require "pp"


$top_level = self

def get_self
  return $top_level
end

class MyClass
  attr_reader :var

  def testing_self
    @var = 10
    my_method
    self.my_method
    self
  end

  def my_method
    @var += 1
  end
end

class C
  def public_method_1
    self.private_method
  end

  def public_method_2
    private_method
  end

  private
  def private_method
    "I am private method"
  end
end

class TestSample < Minitest::Test
  def setup
    @foo = "foo"
  end

  def get_foo
    return @foo
  end

  def test_01
    # カレントオブジェクトはself
    # 省略すると暗黙でselfを呼び出す
    assert_equal(TestSample, self.class)
    assert_equal("foo", @foo)
    assert_equal("foo", get_foo)
    assert_equal("foo", self.get_foo)
  end

  def test_02
    # topレベルコンテキストはmainオブジェクトだが、呼び出す改装に
    assert_equal("main", get_self.to_s)
  end

  def test_03
    # 暗黙のインスタンスメソッド呼び出しはレシーバーがself
    obj = MyClass.new
    ret = obj.testing_self
    assert_equal(12, ret.var)
  end

  def test_04
    # privateメソッドは暗黙的なレシーバselfに対して呼び出す必要がある
    # privateのついたメソッドはレシーバを指定できない
    c = C.new
    assert_raises NoMethodError do
      c.public_method_1
    end

    assert_equal("I am private method", c.public_method_2)
  end
end

