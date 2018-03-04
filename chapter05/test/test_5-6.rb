require "minitest/autorun"
require "awesome_print"
require "pp"

class MyClass
  def my_method
    "hello"
  end

  alias_method :m, :my_method
end

class String
  alias_method :real_length, :length

  def length
    real_length > 5 ? 'long' : 'short'
  end
end

class TestSample < Minitest::Test
  def setup
  end

  def test_01
    obj = MyClass.new
    assert_equal(obj.m, obj.my_method)
  end

  def test_02
    assert_equal("short", "foo".length)
    assert_equal("long", "hogehoge".length)
    assert_equal(5, "aiueo".real_length)
  end

end

module Kernel
  # アラウンドエイリアス
  # 1. メソッドにエイリアスをつける
  # 2. メソッドを再定義する
  # 3. 新しいメソッドから古いメソッドを呼び出す
  alias_method :require_without_record, :require
  def require(file)
    $requires << file if caller[1] =~ /rake2thor:/
    require_without_record file
  end
end

class TestSample2 < Minitest::Test
  def setup
  end

  def test_01

  end
end