require "minitest/autorun"
require "awesome_print"
require "pp"

module M
  def self.my_method
    "hello"
  end
end

class C1
  include M
end

module M2
  def my_method
    "hello"
  end
end

class C2
  class << self
    include M2
  end
end

class TestSample < Minitest::Test
  def setup
  end

  def test_01
    assert_raises NoMethodError do
      C1.my_method
    end
  end

  def test_02
    assert_equal("hello", C2.my_method)
  end
end