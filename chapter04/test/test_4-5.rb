require "minitest/autorun"
require "pp"

class TestSample < Minitest::Test
  def setup
  end

  def test_01
    inc = Proc.new {|x| x + 1}
    assert_equal(2, inc.call(1))
  end

  def test_02
    dec = lambda {|x| x - 1}
    assert_equal(Proc, dec.class)
    assert_equal(2, dec.call(3))
  end

  def test_03
    l = ->(x) {x + 1}
    assert_equal(Proc, l.class)
  end

  def test_04
    def math(a, b)
      yield(a, b)
    end

    def do_math(a, b, &operation)
      math(a, b, &operation)
    end

    ret = do_math(2, 3) {|x, y| x * y}
    assert_equal(6, ret)
  end

  def test_05
    def my_method(greeting)
      "#{greeting}, #{yield}"
    end

    my_proc = proc {"Bill"}
    assert_equal(Proc, my_proc.class)
    ret = my_method("Hello", &my_proc)
    assert_equal("Hello, Bill", ret)
  end


end
