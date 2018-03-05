require "minitest/autorun"
require "awesome_print"
require "pp"

String.class_eval do
  alias_method :length_alias, :length
end

module ExplicitString
  def length
    super > 5 ? 'long' : 'short'
  end

  def length_old
    length_alias
  end
end

String.class_eval do
  prepend ExplicitString
end

class TestSample < Minitest::Test
  def setup
  end

  def test_01
    # prependラッパー
    assert_equal('long', "war and peace".length)
    assert_equal('short', "hoge".length)
  end


  def test_02
    assert_equal(8, "fugafuga".length_old)
    assert_equal("long", "fugafuga".length)
    assert_equal(3, "foo".length_old)
    assert_equal("short", "bar".length)
  end

  def test_03
    assert_equal([
                   ExplicitString, String, Comparable,
                   Object, PP::ObjectMixin, Minitest::Expectations,
                   Kernel, BasicObject
                 ], String.ancestors)
  end
end
