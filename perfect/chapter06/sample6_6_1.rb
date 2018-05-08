module Hoge
  refine String do
    def hello
      "#{self} hello"
    end
  end
end

module Moge
  using Hoge
  class << self
    def oops
      puts "oops".hello
    end
  end
end

module Foo
  class << self
    def oops
      puts "oops".hello
    end
  end
end

Moge::oops
begin
  Foo::oops
rescue Exception => e
  puts e.to_s
end
