require "minitest/autorun"
require "pp"

def a_method(a, b)
  a + yield(a, b)
end

def b_method(a, b)
  return a + yield(a, b) if block_given?
  "no block"
end

class TestSample < Minitest::Test
  def setup
  end

  def test_01
    res = a_method(1, 2) do |a, b|
      a + b
    end
    assert_equal(4, res)
  end

  def test_02
    assert_equal('no block', b_method(1, 2))
  end
end

