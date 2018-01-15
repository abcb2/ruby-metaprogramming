require "minitest/autorun"

=begin

  p.28 図2-5の検証

=end

class MyClass

end

class TestSample < Minitest::Test
  def setup
    @obj1 = MyClass.new
    @obj2 = MyClass.new
  end

  def test_obj
    assert_equal(MyClass, @obj1.class)
    assert_equal(MyClass, @obj2.class)
  end

  def test_myclass
    assert_equal(Class, MyClass.class)
    assert_equal(Object, MyClass.superclass)
  end

  def test_class
    assert_equal(Class, Class.class)
    assert_equal(Module, Class.superclass)
  end

  def test_object
    assert_equal(Class, Object.class)
    assert_equal(BasicObject, Object.superclass)
  end

  def test_module
    assert_equal(Class, Module.class)
    assert_equal(Object, Module.superclass)
  end

end

# describe "this is sample" do
#   it "must be true" do
#     true.must_equal true
#   end
# end
