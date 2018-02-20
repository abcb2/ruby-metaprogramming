require "minitest/autorun"
require "pp"

class TestSample < Minitest::Test
  def setup
  end

  def test_01
    def double(callable_obj)
      callable_obj.call * 2
    end

    l = lambda {return 10}

    assert_equal(20, double(l))
  end

  def test_02
    def another_double
      p = Proc.new {return 10}
      result = p.call
      return result * 2
    end

    assert_equal(10, another_double)
  end

  def test_03
    def double(callable_obj)
      callable_obj.call * 2
    end

    p = Proc.new {10}
    assert_equal(20, double(p))
  end

  def test_04
    p = Proc.new {|x, y| [x, y]}
    assert_equal([1, 2], p.call(1, 2, 3))
    assert_equal([1, nil], p.call(1))
  end
end
