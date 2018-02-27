require "minitest/autorun"
require "awesome_print"

class TestSample < Minitest::Test
  def setup
  end

  def test_01
    str = "just a regular string"
    def str.title?
      self.upcase == self
    end
    assert_equal(false, str.title?)
    assert_equal([:title?], str.methods.grep(/title/))
    assert_equal([:title?], str.singleton_methods)
  end

end
