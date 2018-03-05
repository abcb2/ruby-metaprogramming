require "awesome_print"

String.class_eval do
  alias_method :length_old, :length
end

module MyString
  def length
    super > 5 ? "long" : "short"
  end
end

String.class_eval do
  prepend MyString
end

ap String.ancestors
ap "foo".length
ap "fugafuga".length
ap "foo".length_old
ap "fugafuga".length_old