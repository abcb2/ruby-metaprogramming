require "minitest/autorun"
require "awesome_print"

def add_method_to(a_class)
  a_class.class_eval do
    def my_method
      "Hello!"
    end
  end
end

class TestSample < Minitest::Test
  def setup
  end

  def test_01
    add_method_to String
    assert_equal("Hello!", "hoge".my_method)
    assert_equal([:my_method], String.instance_methods(false).grep(/my_method/))
    assert_includes(String.instance_methods(false), :my_method)
  end

  def test_02
  end
end

