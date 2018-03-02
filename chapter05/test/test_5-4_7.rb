require "minitest/autorun"
require "awesome_print"
require "pp"

module MyModule
  def my_method
    "hello"
  end
end


class TestSample < Minitest::Test
  def setup
  end

  def test_01
    obj = Object.new
    class << obj
      include MyModule
    end

    assert_equal("hello", obj.my_method)
    assert_equal([:my_method], obj.singleton_methods)
  end

end