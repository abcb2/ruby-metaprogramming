require "minitest/autorun"
require "pp"

my_var = "成功"
MyClass = Class.new do
  define_method :my_method do
    my_var
  end
end

def define_methods
  shared = 0
  Kernel.send :define_method, :counter do
    shared
  end

  Kernel.send :define_method, :inc do |x|
    shared += x
  end
end

define_methods

class TestSample < Minitest::Test
  def setup
  end

  def test_01
    # 共有スコープ
    assert_equal(0, counter)
    inc 1
    assert_equal(1, counter)
    inc 10
    assert_equal(11, counter)
  end
end

