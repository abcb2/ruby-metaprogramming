require "minitest/autorun"
require "awesome_print"
require "pp"

module M
  def my_method
    "hello"
  end
end

class C
  extend M
end

class TestSample < Minitest::Test
  def setup
  end

  def test_01
    obj = Object.new
    obj.extend M
    assert_equal("hello", obj.my_method)
  end

  def test_02
    assert_equal("hello", C.my_method)
  end

end