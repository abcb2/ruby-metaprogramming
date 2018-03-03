require "minitest/autorun"
require "awesome_print"
require "pp"

class MyClass
  def my_method
    "hello"
  end

  alias_method :m, :my_method
end

class String
  alias_method :real_length, :length

  def length
    real_length > 5 ? 'long' : 'short'
  end
end

class TestSample < Minitest::Test
  def setup
  end

  def test_01
    obj = MyClass.new
    assert_equal(obj.m, obj.my_method)
  end

  def test_02
    assert_equal("short", "foo".length)
    assert_equal("long", "hogehoge".length)
    assert_equal(5, "aiueo".real_length)
  end

end