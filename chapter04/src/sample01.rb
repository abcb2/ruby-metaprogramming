require 'pp'
require 'ap'

lambda do
  setups = []
  events = []
  Kernel.send :define_method, :setup do |&block|
    setups << block
  end
  Kernel.send :define_method, :event do |description, &block|
    events << { description: description, condition: block }
  end
  Kernel.send :define_method, :each_setups do |&block|
    setups.each do |setup|
      block.call setup
    end
  end
  Kernel.send :define_method, :each_events do |&block|
    events.each do |event|
      block.call event
    end
  end
end.call

setup do
  puts "空の高さを設定"
  @sky_height = 100
end

setup do
  puts "山の高さを設定"
  @mountains_height = 200
end

event "空が落ちてくる" do
  @sky_height < 300
end

event "空が近づいてくる" do
  @sky_height < @mountains_height
end

event "もうダメだ" do
  @sky_height < 0
end

each_events do |event|
  each_setups do |setup|
    setup.call
  end
  puts "Alert #{event[:description]}" if event[:condition].call
end

ap self.instance_variables