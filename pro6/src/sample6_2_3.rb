module My
  class Klass
    @@count = 0


    def initialize
      @@count += 1
    end

    def method1
      @@count
    end

    def self.check
      @@count
    end
  end
end

class Hogehoge < My::Klass

end

k = My::Klass.new
puts k.method1 # 1
5.times do
  My::Klass.new
end

puts My::Klass.check # 6

h = Hogehoge.new
puts My::Klass.check # 7
puts Hogehoge.check # 7 クラス変数を共有してしまっている
