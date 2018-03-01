require "awesome_print"

foo = "abc"
class << foo
  def hoge
    self
  end

  class << self
    self
  end
end
ap foo.singleton_class
ap foo.singleton_methods

ap "---------------------"

ret = class << "hoge"
  def moge
    self
  end
  self
end
ap ret
ap ret.class

