require "minitest/autorun"

class MyClass
  def my_method
    puts "yes my_method"
  end
end

class TestSample < Minitest::Test
  def setup
    @obj1 = MyClass.new
    @obj2 = MyClass.new
  end

  def test_01
    # クラスはClassクラスのオブジェクト
    assert_equal(Class, MyClass.class)
    assert_equal(Class, String.class)
  end

  def test_02
    assert_equal(MyClass, @obj1.class)
  end

  def test_03
    # オブジェクトのメソッドはそのクラスのインスタンスメソッド
    assert_equal(Class.instance_methods(), MyClass.methods())

    # allocateはインスタンス作成時にinitializeを呼び出さない以外はnewと一緒
    # superclassはイントロスペクションをするためのメソッド
    assert_equal(
        [:allocate, :new, :superclass],
        Class.instance_methods(false).sort
    )
  end

  def test_04
    # ClassクラスのスーパークラスはModule
    # ModuleとClassの違いは何かと聞かれれば、インクルードする場合はモジュールを使い
    # インスタンスの生成や継承をするときはクラスを選択する
    assert_equal(Module, Class.superclass)
  end

  def test_05
    # MyClassのスーパークラスはObject
    assert_equal(Object, MyClass.superclass)
  end

end

