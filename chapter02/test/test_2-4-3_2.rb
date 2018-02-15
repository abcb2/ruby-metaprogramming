require "minitest/autorun"
require "pp"

class MyClass
  def my_method
    "original my_method"
  end

  def another_method
    my_method
  end
end

module MyClassRefinements
  refine MyClass do
    def my_method
      "refined my_method"
    end
  end
end

class TestSample < Minitest::Test
  using MyClassRefinements

  def setup
  end

  def test_01
    assert_equal("refined my_method", MyClass.new.my_method)
  end

  def test_02
    # refineされていないので、メソッド呼び出しの結果を注意深く検証する必要がある。
    assert_equal("original my_method", MyClass.new.another_method)
  end

end

