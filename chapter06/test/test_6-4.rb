require "minitest/autorun"
require "awesome_print"

class Person

end

def add_checked_attribute(klass, attr)
  klass.class_eval do
    define_method "#{attr}=" do |value|
      raise 'Invalid attribute' unless value
      instance_variable_set("@#{attr}", value)
    end

    define_method attr do
      instance_variable_get("@#{attr}")
    end
  end
end

class TestSample < Minitest::Test
  def setup
    add_checked_attribute(Person, :age)
    @bob = Person.new
  end

  def test_accepts_valid_values
    @bob.age = 20
    assert_equal 20, @bob.age
  end

  def test_refuses_nil_values
    e = assert_raises RuntimeError, 'Invalid attribute' do
      @bob.age = nil
    end
    assert_equal('Invalid attribute', e.to_s)
  end

  def test_refuses_false_values
    assert_raises RuntimeError, 'Invalid attribute' do
      @bob.age = false
    end
  end
end

