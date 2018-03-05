require "awesome_print"

module MyString
  refine String do
    alias_method :length_old, :length

    def length
      super > 5 ? "long" : "short"
    end
  end
end

using MyString

ap "foo".length
ap "fugafuga".length
ap "foo".length_old
ap "fugafuga".length_old