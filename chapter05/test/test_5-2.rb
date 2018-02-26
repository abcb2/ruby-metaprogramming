require "minitest/autorun"
require "awesome_print"

class MyClass < Array
  def my_method
    "Hello!"
  end
end

MyClass2 = Class.new(Array) do
  def my_method
    "Hello!"
  end
end

class TestSample < Minitest::Test
  def setup
    @obj1 = MyClass.new
    @obj2 = MyClass2.new
  end

  def test_01
    assert_equal(MyClass, @obj1.class)
    assert_equal(MyClass2, @obj2.class)
  end

  def test_02
    assert_equal("Hello!", @obj1.my_method)
    assert_equal("Hello!", @obj2.my_method)
  end

end
