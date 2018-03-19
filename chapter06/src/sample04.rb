require "awesome_print"

class String
  def self.inherited(subclass)
    puts "#{self}は#{subclass}に継承された"
  end
end

class MyString < String

end

module M1
  def self.included(othermod)
    puts "#{self}は#{othermod}にincludeされた"
  end
end

class Foo
  include M1
end
