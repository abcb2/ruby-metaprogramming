require "minitest/autorun"
require "pp"

def my_method
  x = "Goodbye"
  yield("cruel")
end

def just_yield
  yield
end

class TestSample < Minitest::Test
  def setup
  end

  def test_01
    # my_methodの中にあるxはブロックからは見えない
    x = "Hello"
    res = my_method do |y|
      "#{x}, #{y} world"
    end

    assert_equal("Hello, cruel world", res)
  end

  def test_02
    # local_to_blockはブロックの中だけで有効
    top_level_variable = 1
    just_yield do
      top_level_variable += 1
      local_to_block = 1
    end
    assert_equal(2, top_level_variable)
    e = assert_raises NameError do
      local_to_block
    end
    assert_match(/^undefined local variable or method `local_to_block'.+/, e.to_s)
  end

end

