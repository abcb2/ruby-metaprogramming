class Hoge
  # Hogeクラスもオブジェクト
  puts "A1: #{self == Hoge}"
  puts "A2: #{self.superclass == Object}"

  # HogeクラスのクラスはClassクラス
  puts "B1: #{self.class == Class}"
  # Classクラスの親クラスはModule
  puts "B2: #{self.class.superclass == Module}"


  # initialize内で定義するインスタンス変数と区別して
  # ここでの変数はクラスインスタンス変数という
  @class_instance_val = 100

  # 暗黙のselfが省略されている。
  puts "C1: #{@class_instance_val == 100}"

  def access1
    @class_instance_val # nil
  end

  def self.access2
    @class_instance_val # 100
  end
end

h = Hoge.new

puts "C2: #{h.access1.nil?}"
puts "C3: #{Hoge.access2 == 100}"

