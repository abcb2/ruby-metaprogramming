require "minitest/autorun"
require "awesome_print"

class C
  class << self
    def a_class_method
      "C.a_class_method()"
    end
  end
end

class D < C

end

class MyClass
  def self.a_class_method2
    "a_class_method2"
  end

  class << self
    def a_class_method3
      "a_class_method3"
    end
  end
end

def MyClass.a_class_method
  "a_class_method"
end


class TestSample < Minitest::Test
  def setup
  end

  def test_01
    assert_equal("#<Class:C>", C.singleton_class.to_s) # #<Class:C> < #<Class:Object>
    assert_equal("#<Class:D>", D.singleton_class.to_s) # #<Class:D> < #<Class:C>
    assert_equal("#<Class:C>", D.singleton_class.superclass.to_s) # #<Class:C> < #<Class:Object>
    assert_equal("#<Class:Object>", C.singleton_class.superclass.to_s) # #<Class:Object> < #<Class:BasicObject>
  end

  def test_02
    assert_equal("a_class_method", MyClass.a_class_method)
    assert_equal("a_class_method2", MyClass.a_class_method2)
    assert_equal("a_class_method3", MyClass.a_class_method3)
    assert_equal([:a_class_method, :a_class_method2, :a_class_method3], MyClass.singleton_methods)
  end
end