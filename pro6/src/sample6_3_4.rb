module ExModule
  def extend_method
    :extend_method
  end
end

obj = Object.new
obj.extend ExModule
puts "A1: #{obj.extend_method}"
puts "A2: #{obj.singleton_class.ancestors}"
begin
  Object.extend_method
rescue Exception => e
  puts "A3: #{e.to_s.sub!(/\n/, ' ')}"
end

class Hoge
  extend ExModule
end

h = Hoge.new
begin
  puts h.extend_method
rescue Exception => e
  puts "B1: #{e.to_s}"
end

puts "B2: #{Hoge.extend_method == :extend_method}"

# インスタンスobjectにextendするとオブジェクトにメソッドを生やすことができる
# class定義内でextendするとクラスメソッドの定義になる。

hello = "hello"

def hello.say
  "#{self} world"
end

puts "C1: #{hello.say}"
