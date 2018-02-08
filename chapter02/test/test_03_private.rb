require "minitest/autorun"
require "pp"

=begin

  - privateメソッド

=end

class MyClass01
  attr_reader :mess

  def initialize
    @mess = self.private_method
  end

  private
  def private_method
    'I am private method'
  end
end

class MyClass02
  attr_reader :mess

  def initialize
    ## レシーバーを指定しない(暗黙の指定にする)
    @mess = private_method
  end

  private
  def private_method
    'I am private method'
  end
end

class MyClass03 < MyClass02
  attr_reader :my_mess

  def initialize
    @my_mess = private_method
  end
end

class TestSample < Minitest::Test
  def test_private_01
    assert_raises NoMethodError do
      MyClass01.new
    end
  end

  def test_private_02
    assert_equal('I am private method', MyClass02.new.mess)
  end

  def test_private_03
    obj = MyClass03.new
    assert_equal('I am private method', obj.my_mess)
    assert_nil(obj.mess)
  end
end
