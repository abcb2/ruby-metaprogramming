module BeforeHelloFilter
  def hello
    "HI! " + super
  end
end

class Hello
  prepend BeforeHelloFilter

  def hello
    "hello"
  end
end

h = Hello.new
puts "A1: #{h.hello == 'HI! hello'}"