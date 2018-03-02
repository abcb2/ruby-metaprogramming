require "minitest/autorun"
require "awesome_print"
require "pp"

class C
  attr_accessor :a
end

class D < C

end

class C2
  class << self
    attr_accessor :a
  end
end

class C3
  @@hoge = "yes"

  def initialize
    @hoge = 200
  end

  class << self
    @hoge = 100

    def get_hoge
      @hoge
    end

    def get_hoge2
      @@hoge
    end
  end
end

class TestSample < Minitest::Test
  def setup
  end

  def test_01
    obj = D.new
    obj.a = 100
    assert_equal(100, obj.a)
    obj2 = C.new
    assert_nil(obj2.a)
  end

  def test_02
    C2.a = "yes"
    assert_equal("yes", C2.a)
  end

  def test_03
    assert_equal("yes", C3.get_hoge2)
    assert_nil(C3.get_hoge)
    obj = C3.new
    assert_nil(C3.get_hoge)
    assert_equal("yes", C3.get_hoge2)
  end
end