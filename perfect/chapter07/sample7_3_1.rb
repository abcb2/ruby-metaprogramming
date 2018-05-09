#= sample7_3_1
#
#== eval族
#- Kernel.#eval
#- Module#class_eval
#- Module#module_eval
#- BasicObject#instance_eval


eval 'p self'
obj = Object.new
obj.instance_eval { p self }
obj.class.class_eval { p self }
Kernel.module_eval { p self }

class LoggingInstanceVariable
  attr_reader :first_val, :before_first_val

  def first_val=(val)
    @before_first_val = @first_val
    @first_val = val
  end
end

l = LoggingInstanceVariable.new
pp l
l.first_val = 100
pp l
l.first_val = 2
pp l

puts "*" * 20

class LIV
  logging_instance_val_names = %w(first_val second_val third_val)
  logging_instance_val_names.each do |val_name|
    eval <<-END_OF_DEF
      attr_reader :#{val_name}, :before_#{val_name}
      
      def #{val_name}=(val)
        @before_#{val_name} = @#{val_name}
        @#{val_name} = val
      end
    END_OF_DEF
  end
end

obj = LIV.new
obj.first_val = 100
pp obj

obj.first_val = 200
pp obj

obj.second_val = :yes
obj.second_val = :no
obj.third_val = :aiueo
pp obj
