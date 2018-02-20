require "minitest/autorun"
require "pp"

v1 = 1
class MyClass
  v2 = 2
  puts local_variables # :v2

  def my_method
    v3 = 3
    local_variables
  end

  puts local_variables # :v2
end
puts local_variables # :v1

class TestSample < Minitest::Test
  def setup
    @obj = MyClass.new
  end

  def test_01
    assert_equal([:v3], @obj.my_method)
  end
end

