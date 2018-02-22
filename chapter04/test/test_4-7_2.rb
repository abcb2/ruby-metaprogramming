require "minitest/autorun"
require "pp"

lambda do
  setups = []
  events = []

  Kernel.send :define_method, :setup do |description, &block|
    puts description
    setups << block
  end
  Kernel.send :define_method, :event do |description, &block|
    events << { description: description, condition: block }
  end
  Kernel.send :define_method, :each_event do |&block|
    events.each do |event|
      block.call event
    end
  end
  Kernel.send :define_method, :each_setup do |&block|
    setups.each do |setup|
      block.call setup
    end
  end
end.call

setup "空の高さを設定" do
  @sky_height = 100
end
setup "山の高さを設定" do
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

each_event do |event|
  each_setup do |setup|
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
