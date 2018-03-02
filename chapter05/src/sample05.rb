require "awesome_print"

module M
  def self.my_method
    "hello"
  end
  def hoge
    "hoge"
  end
end

class C
  class << self
    include M
  end
end

ap M.my_method
ap C.singleton_methods
ap M.singleton_methods
ap C.singleton_class
ap C.ancestors
ap C.singleton_class.ancestors
ap C.hoge
ap C.singleton_class.new.my_method
