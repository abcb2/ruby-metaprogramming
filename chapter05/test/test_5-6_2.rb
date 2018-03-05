require "minitest/autorun"
require "awesome_print"
require "pp"

module StringRefinements
  refine String do
    def length
      super > 5 ? 'long' : 'short'
    end
  end
end
using StringRefinements

class TestSample < Minitest::Test
  def setup
  end

  def test_01
    # Refinementsラッパー
    assert_equal('long', "war and peace".length)
    assert_equal('short', "hoge".length)

  end
end
