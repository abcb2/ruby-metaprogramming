require 'pp'

lambda do
  setups = []
  events = []
  Kernel.send :define_method, :setup do |&block|
    setups << block
  end
  Kernel.send :define_method, :event do |description, &block|
    events << { description: description, event: block }
  end
  Kernel.send :define_method, :each_events do

  end
  Kernel.send :define_method, :each_setups do
    
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

