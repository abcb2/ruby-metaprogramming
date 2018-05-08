Klass = Class.new do |klass|
  klass == self # true

  def hello
    :hello
  end
end

klass_obj = Klass.new
puts Klass.name # Klass
puts klass_obj.hello == :hello # true

Klass2 = Class.new(Klass)
klass2_obj = Klass2.new
puts klass2_obj.hello == :hello # true

k = Class.new
puts k.name.nil? # true 定数に入れないとnilとなり無名クラスができる

k_obj = k.new
puts k_obj.class.name.nil? # true
