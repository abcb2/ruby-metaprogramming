require "minitest/autorun"
require "pp"

def event(description)
  "ALERT: #{description}" if yield
end

class TestSample < Minitest::Test
  def setup
  end

  def test_01
    # DSLのサンプル
    ret = event "always alert" do
      true
    end
    assert_equal("ALERT: always alert", ret)
  end

  def test_02
    ret = event "never alert" do
      false
    end
    assert_nil(ret)
  end
end
