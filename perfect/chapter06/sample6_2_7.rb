# 6-2-4 no2

module IncludeModule
  def include_module_method
    :include_module_method
  end

  def mymethod
    :mymethod
  end
end

class Klass
  include IncludeModule

  define_method :mymethod, IncludeModule.instance_method(:mymethod)
end

k = Klass.new
puts "A1: #{k.include_module_method == :include_module_method}"
puts "A2: #{k.mymethod == :mymethod}"

module UnIncludedModule
  def un_included_module_method
    :un_included_module_method
  end

  def hoge
    :hoge
  end

  def moge
    :moge
  end
end

class Klass2
  # include UnIncludedModule

  define_method :un_included_module_method, UnIncludedModule.instance_method(:un_included_module_method)
  define_method :hoge, UnIncludedModule.instance_method(:hoge)
end

k2 = Klass2.new
puts "B1: #{k2.un_included_module_method == :un_included_module_method}"
puts "B2: #{k2.hoge == :hoge}"

begin
  k2.moge
rescue Exception => e
  puts e
end

module Mine
  def hoge
    @hoge
  end

  def moge
    @moge
  end
end

module Mine2
  def yes
    :yes
  end

  def yes2
    @hoge
  end
end

class MyMine
  include Mine

  define_method :yes, Mine2.instance_method(:yes)
  define_method :yes2, Mine2.instance_method(:yes2)

  def initialize
    @hoge = :hoge
  end
end

mine = MyMine.new
puts "C1: #{mine.hoge == :hoge}"
puts "C2: #{mine.moge.nil?}"
puts "C3: #{mine.yes == :yes}"
puts "C4: #{mine.yes2 == :hoge}"
