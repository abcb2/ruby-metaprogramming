require "minitest/autorun"
require "pp"

=begin

  p.3

=end

class Greeting
  def initialize(text)
    @text = text
  end

  def welcome
    @text
  end
end

class TestSample < Minitest::Test
  def setup
    @my_obj = Greeting.new("Hello")
  end

  def test_obj
    assert_equal Greeting, @my_obj.class
    assert_equal [:welcome], @my_obj.class.instance_methods(false)
  end

end
