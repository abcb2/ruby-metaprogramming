class Klass
  puts "1: #{self == Klass}"

  # オブジェクトはインスタンス変数を持つことができる。
  # クラスオブジェクトも例外ではない
  # クラス変数と区別してクラスインスタンス変数と呼ぶ場合もある
  @class_instance_val = :class_instance_val
  puts "2: #{@class_instance_val == :class_instance_val}"

  def method1
    # インスタンス変数へのアクセスとみなされnilが返却される
    @class_instance_val
  end

  def method2
    Klass.method3
  end

  def self.method3
    @class_instance_val
  end
end

k_obj = Klass.new
puts "B1: #{k_obj.method1}" # nil
puts "B2: #{k_obj.method2}"
puts "B3: #{Klass.method3}"