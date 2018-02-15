require "minitest/autorun"
require "pp"

module StringExtensions
  refine String do
    def reverse
      "esrever"
    end
  end
end

module StringStuff
  using StringExtensions

  def self.my_test
    "my_string".reverse
  end
end

class TestSample < Minitest::Test
  def setup
  end

  def test_01
    # 変更をグローバルにしないためにはRefinementsを使う
    assert_equal("esrever", StringStuff.my_test)
  end

  def test_02
    assert_equal("gnirts_ym", "my_string".reverse)
  end

end

