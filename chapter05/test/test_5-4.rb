require "minitest/autorun"
require "awesome_print"

class TestSample < Minitest::Test
  def setup
  end

  def test_01
    # 特異クラスはオブジェクトの特異メソッドが住んでいる場所

    obj = Object.new
    singleton_class = class << obj
      self
    end

    def obj.my_singleton_method
    end

    assert_equal([:my_singleton_method], singleton_class.instance_methods.grep(/my/))
  end

end
