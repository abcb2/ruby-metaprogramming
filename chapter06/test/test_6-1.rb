require "minitest/autorun"
require "awesome_print"

module CheckedAttributes
  class << self
    def attr_checked(age, &block)
      puts "hello"
    end
  end
end

class Person
  include CheckedAttributes
  ap self.ancestors
  ap self.methods
  # attr_checked :age do |v|
  #   v >= 18
  # end
end

class TestSample < Minitest::Test
  def setup

  end

  def test_01
    me = Person.new


    # me.age = 40
    # assert_raises Exception do
    #   me.age = 12
    # end
  end

end

