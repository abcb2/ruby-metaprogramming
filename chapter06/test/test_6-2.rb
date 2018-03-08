require "minitest/autorun"
require "awesome_print"

class TestSample < Minitest::Test
  def setup

  end

  def test_01
    array = %w/a b c/
    x = 'd'
    array.instance_eval "self[1] = x"
    assert_equal(%w[a d c], array)
  end

  def test_02
    array = %w/e f g/
    x = 'z'
    array.instance_eval do
      "self[2] = x"
    end
    assert_equal(%w[e f g], array)

    array.instance_eval do
      self[2] = x
    end
    assert_equal(%w[e f z], array)
  end

end

