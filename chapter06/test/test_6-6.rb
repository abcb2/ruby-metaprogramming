require "minitest/autorun"
require "awesome_print"


class Class
  def attr_checked(attr, &validation)
    define_method "#{attr}=" do |val|
      raise "Invalid attribute" unless validation.call(val)
      instance_variable_set("@#{attr}", val)
    end

    define_method attr do
      instance_variable_get "@#{attr}"
    end
  end
end

class Person
  attr_checked :age do |v|
    v >= 18
  end
end

class TestSample < Minitest::Test
  def setup
    @bob = Person.new
  end

  def test_accepts_valid_values
    @bob.age = 20
    assert_equal 20, @bob.age
  end

  def test_refuses_invalid_values
    assert_raises RuntimeError, 'Invalid attribute' do
      @bob.age = 17
    end
  end

  # def test_refuses_nil_values
  #   e = assert_raises RuntimeError, 'Invalid attribute' do
  #     @bob.age = nil
  #   end
  #   assert_equal('Invalid attribute', e.to_s)
  # end
  #
  # def test_refuses_false_values
  #   assert_raises RuntimeError, 'Invalid attribute' do
  #     @bob.age = false
  #   end
  # end
end

