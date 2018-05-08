class Klass
  puts "A1: #{self}"
end
class << Klass
  puts "A2: #{self}"

  def yes
    :yes
  end
end
klass = Klass.new

class << klass
  puts "A3: #{self}"

  def hoge
    :hoge
  end
end

# 特異クラス定義式を使って内部から特異クラスを取得することもできるが、
# この書き方は一般的な特異メソッド(クラスメソッド)の定義に使うと失敗するので注意が必要
puts "B1: #{class << klass;self;end == klass.singleton_class}"

class << Klass
  puts "A4: #{self}"

  def yes2
    :yes2
  end
end

puts Klass.yes
begin
  puts Klass.hoge
rescue Exception => e
  puts e.to_s
end
puts Klass.yes2



