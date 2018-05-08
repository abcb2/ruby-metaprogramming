module My2
  class Klass
    @instance_count = 0

    def self.count_up
      @instance_count += 1 if @instance_count
    end

    def self.instance_count
      @instance_count
    end

    def initialize
      self.class.count_up
    end
  end
end

class My3Klass < My2::Klass

end

5.times do
  My2::Klass.new
end

puts My2::Klass.instance_count # 5

4.times do
  My3Klass.new
end

puts My2::Klass.instance_count # 5
puts My3Klass.instance_count # nil
