# openclass

class String
  def method_missing(method, *args)
    "HERE #{method} #{args}"
  end
end


puts "A1: #{'foo'.no_method(1, 2, 3) == 'HERE no_method [1, 2, 3]'}"

puts "*" * 20

class DelegateArray
  def initialize
    @array = []
  end

  def method_missing(method, *args)
    @array.__send__ method, *args
  end
end

da = DelegateArray.new

1.upto(10).each { |i| da << i }
p da

puts "*" * 20

class LoopMethodMissingClass
  def method_missing(name, *args)
    __send__(name)
  end
end
begin
  LoopMethodMissingClass.new.no_method
rescue SystemStackError => e
  p e
end

puts "*" * 20

class OverrideMethodMissing
  TARGET_METHODS = [:target_method1, :target_method2]

  def method_missing(method, *args)
    if TARGET_METHODS.include?(method)
      return 'target_method is called'
    end
    super
  end
end

o = OverrideMethodMissing.new
puts "C1: #{o.target_method1 == 'target_method is called'}"
begin
  puts o.target_method3
rescue Exception => e
  p e
end

puts "*" * 20