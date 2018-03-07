require "awesome_print"

class MyClass
  def my_method
    @x = 1
    binding
  end

  def my_method2
    eval "self", TOPLEVEL_BINDING
  end
end

b = MyClass.new.my_method
ap eval("@x", b)

ap MyClass.new.my_method2