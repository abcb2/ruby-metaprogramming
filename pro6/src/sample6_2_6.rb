# 6-2-4

def hoge(*args, &block)
  puts args
  puts block
  yield if block_given?
end

hoge(100, 200) do
  puts "yes"
end

mylambda = lambda do |*args|
  puts "yes lambda"
  puts args
end
puts mylambda
mylambda.call(1, 2, 3)

proc = Proc.new do |*args|
  puts "YES PROC"
  puts args
end
proc.call(7, 8, 9)

hoge = -> (*args) {
  puts "YES HERE"
  puts args
}
puts hoge
hoge.call(10, 20, 30)