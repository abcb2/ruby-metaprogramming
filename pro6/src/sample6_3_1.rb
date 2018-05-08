# 6-3

hello = "hello"

def hello.say(count = 1)
  count.times { puts self }
end

hello.say 2

puts "=" * 20


another_hello = "hello"
begin
  another_hello.say 3
rescue Exception => e
  puts e.to_s
end

puts "=" * 20

hello2 = "hello2"
class << hello2
  def say_world
    puts "#{self} world!!"
  end
end
hello2.say_world

puts "=" * 20


class Hoge
  def foo
    :foo
  end

  class << self
    def hoge
      :hoge
    end
  end
end
class << Hoge
  def hogemoge
    :hogemoge
  end
end
puts "B2: #{Hoge::hogemoge}"

obj = Hoge.new
puts "B3: #{obj.class.method_defined? :foo}"
puts "B4: #{obj.class.method_defined? :hoge}"
puts "B5: #{obj.singleton_class.methods(false) == [:hoge, :hogemoge]}"