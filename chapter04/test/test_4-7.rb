require "minitest/autorun"
require "pp"


## topレベルで全部やってしまうあまり良くない例
@events = []
@setups = []

def event(description, &block)
  @events << { description: description, condition: block }
end

def setup(&block)
  @setups << block
end

setup do
  puts "空の高さを設定"
  @sky_height = 100
end

setup do
  puts "山の高さを設定"
  @mountain_height = 200
end

event "空が落ちてくる" do
  @sky_height < 300
end

event "空が近づいてくる" do
  @sky_height < @mountain_height
end

event "もうダメだ" do
  @sky_height < 0
end

@events.each do |event|
  @setups.each do |setup|
    setup.call
  end
  puts "ALERT: #{event[:description]}" if event[:condition].call
end


class TestSample < Minitest::Test
  def setup

  end

  def test_01
  end

end
