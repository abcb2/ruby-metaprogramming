class Klass
end
obj = Klass.new
puts "A1: #{obj.singleton_class.superclass == Klass}"
puts "A2: #{obj.instance_of? Klass}"
puts "A3: #{obj.instance_of? obj.singleton_class}" # false

puts "*" * 20

puts "B1: #{1.class}"
begin
  1.singleton_class
rescue Exception => e
  puts "B2: #{e.to_s}"
end

puts "C1: #{:symbol.class}"
begin
  :symbol.singleton_class
rescue Exception => e
  puts "C2: #{e.to_s}"
end

puts "*" * 20

puts "D1: #{true.class}"
puts "D2: #{true.singleton_class}"

puts "D3: #{false.class}"
puts "D4: #{false.singleton_class}"

puts "D5: #{nil.class}"
puts "D6: #{nil.singleton_class}"

puts "*" * 20
class Hoge
end
hoge = Hoge.new
SingletonClass = hoge.singleton_class
puts "E1: #{SingletonClass}"

begin
  SingletonClass.new
rescue Exception => e
  puts "E2: #{e.to_s}"
end