require "minitest/autorun"
require "pp"

class Computer
  def initialize(computer_id, data_source)
    @id = computer_id
    @data_source = data_source
  end

  def method_missing(name)
    super unless @data_source.respond_to?("get_#{name}_info")
    info = @data_source.send("get_#{name}_info", @id)
    price = @data_source.send("get_#{name}_price", @id)
    result = "#{name.capitalize}: #{info} ($#{price})"
    return "* #{result}" if price >= 100
    result
  end

  def respond_to_missing?(method, include_private = false)

  end
end

class Lawyer
  def bar
  end

  def respond_to_missing?(method, *args)
    puts "yes"
  end
end

class TestSample < Minitest::Test
  def setup
    @l = Lawyer.new
  end

  def test_01
    assert_equal(false, @l.respond_to?(:foo))
    assert_equal(true, @l.respond_to?(:bar))
  end
end

