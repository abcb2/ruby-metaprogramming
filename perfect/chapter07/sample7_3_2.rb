module A1
  class EvalTarget
    def initialize
      @instance_val = :instance_val_dayo
    end

    def instance_binding
      local_val = :local_val_dayo
      binding
    end

    private

    def private_method
      :private_method_dayo
    end
  end

  obj = EvalTarget.new
  binding_obj = obj.instance_binding
  p binding_obj

  puts eval "@instance_val", binding_obj
  puts eval "local_val", binding_obj
  puts eval "private_method", binding_obj

  puts "*" * 20

  class B2
    def initialize
      @hoge = :hoge
    end

    def get_binding
      binding
    end
  end

  b = B2.new
  p b
  binding_obj2 = b.get_binding
  p binding_obj2

  eval "puts @hoge.class; puts @hoge", binding_obj2

  puts "*" * 20
end

module A2
  class ET
    @class_class_instance = 10
    class << self
      def class_class_instance
        @class_class_instance
      end
    end
  end

  puts "A2-1: #{ET.class_class_instance == 10}"
  ET.class_eval do
    @class_class_instance = 5
  end
  puts "A2-2: #{ET.class_class_instance == 5}"

  myval = 777
  ET.class_eval do
    @class_class_instance = myval
  end
  puts "A2-3: #{ET.class_class_instance == 777}"
  puts "A2-4: #{ET.instance_variable_get(:@class_class_instance)}"
end

puts "*" * 20

module A3
  @a3_hoge = :a3_hoge
  class << self
    def a3_hoge
      @a3_hoge
    end
  end
end
puts A3.a3_hoge


module A4
  class Hoge
    def initialize
      @hoge = :hoge
    end
  end
  Hoge.module_eval("def hello; puts :hello; end")
  h = Hoge.new
  h.hello
  Hoge.module_eval do |m|
    puts m

    def yes
      puts :yes
    end
  end
  h.yes
end

puts "*" * 20

# module A5
#   class ET
#     CONST_VAL = "ET::CONST-dayo"
#     attr_accessor :instance_val
#
#     def initialize
#       puts "A5-init: #{CONST_VAL}"
#       @instance_val = 100
#     end
#   end
#   # CONST_VAL = "CONST-dayo"
#   e1 = ET.new
#
#   e1.instance_eval do |*args|
#     puts args
#     puts "A5-eval1: #{CONST_VAL}"
#     # puts "A5-1: #{ET::CONST_VAL}"
#     # puts "A5-2: #{CONST_VAL}"
#     # @instance_val = CONST_VAL
#   end
#   puts "A5-finish: #{e1.instance_val}"
# end

class MyET
  CONST_VAL = "MyET::CONST-dayo"
  attr_accessor :instance_val
end

CONST_VAL = "HOGEHOGE"
CONST_VAL2 = CONST_VAL
me = MyET.new
me.instance_eval do
  puts "A5-1: #{MyET::CONST_VAL}"
  puts "A5-2: #{CONST_VAL}"
  @instance_val = CONST_VAL
end

puts "A5-2: #{me.instance_val}"


me.instance_exec(CONST_VAL) do |const_val|
  puts "A5-3: #{const_val}"
  puts "A5-4: #{CONST_VAL2}"
end
