require "minitest/autorun"

class TestSample < Minitest::Test
  def setup

  end

  def test_sample01
    assert(true)
  end
end

describe "this is sample" do
  it "must be true" do
    true.must_equal true
  end
end
