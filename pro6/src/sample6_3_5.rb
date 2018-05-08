SINGLETON_OBJ = Object.new

class << SINGLETON_OBJ
  def foo
    :foo
  end
end

puts "A1: #{SINGLETON_OBJ.foo == :foo}"

puts "*" * 20

class Hoge
  def initialize
    @name = "I AM HOGE"
  end
end

hoge = Hoge.new

class << hoge
  def check
    @name
  end
end

puts "B1: #{hoge.check == 'I AM HOGE'}"

hoge2 = Hoge.new
begin
  hoge2.check
rescue Exception => e
  puts "B2: #{e.to_s}"
end

puts "*" * 20

module MyEx
  def check
    @name
  end
end

class Moge
  extend MyEx

  def initialize
    @name = :name
  end
end

moge = Moge.new
puts "C1: #{Moge.check == nil}"

moge.extend MyEx
puts "C2: #{moge.check == :name}"

MYCONST = 100
puts "D1: #{MYCONST}"
MYCONST = 200
puts "D2: #{MYCONST}"

puts "*" * 20

SINGLETON_OBJ2 = Object.new
puts "E1: #{SINGLETON_OBJ2.singleton_class}"
puts "E2: #{SINGLETON_OBJ2.class}"
SingletonClass = SINGLETON_OBJ2.singleton_class

def SingletonClass.instance_get
  SINGLETON_OBJ2
end

puts "E3: #{SINGLETON_OBJ2 == SingletonClass.instance_get}"
