require "minitest/autorun"
require "pp"

class MyClass
  def initialize(val)
    @x = val
  end

  def my_method
    @x
  end
end

class TestSample < Minitest::Test
  def setup
    @obj = MyClass.new(1)
  end

  def test_01
    m = @obj.method :my_method
    assert_equal(Method, m.class)
    assert_equal(1, m.call)
  end
end
