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

  def test_03
    def monthly_sales
      110
    end

    target_sales = 100

    ret = event "月間売上が驚くほど高い" do
      monthly_sales > target_sales
    end
    assert_equal("ALERT: 月間売上が驚くほど高い", ret)
  end
end
