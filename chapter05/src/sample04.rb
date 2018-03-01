require "awesome_print"

class Hoge
  @foo = 100
  @@foo2 = 200
  class << self
    def p_foo
      ap @foo
    end

    def p_foo2
      ap @@foo2
    end
  end
end

class Fuga < Hoge

end

Hoge.p_foo
Hoge.p_foo2
puts "----------"
Fuga.p_foo # nil
Fuga.p_foo2