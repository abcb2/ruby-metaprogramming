require "minitest/autorun"
require "pp"

class Lawyer

end

class Lawyer02
  def method_missing(method, *args)
    puts "呼び出した: #{method}(#{args.join(', ')})"
    puts "(ブロックも渡した)" if block_given?
  end
end

class TestSample < Minitest::Test
  def setup
    @lawyer = Lawyer.new
  end

  def test_01
    e = assert_raises NoMethodError do
      @lawyer.talk_simple
    end
    assert_match(/^undefined method `talk_simple'.+$/, e.to_s)
  end


  def test_02
    e = assert_raises NoMethodError do
      @lawyer.send :method_missing, :my_method
    end
    assert_match(/^undefined method `my_method'.+$/, e.to_s)
  end

  def test_03
    @l2 = Lawyer02.new
    @l2.hoge('foo', 'bar') do

    end
  end

  def test_04
    @l2 = Lawyer02.new
    @l2.send(:hogehoge, [1, 2, 3]) do

    end
  end
end

