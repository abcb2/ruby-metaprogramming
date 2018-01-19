require "minitest/autorun"
require "pp"

=begin

  - refinements

=end


# module StringExtensions
#   refine String do
#     def reverse
#       "reserve_test"
#     end
#   end
# end

# module StringStuff
#   # using StringExtensions
#   # def reverse(str)
#   #   str.reverse
#   # end
#
#   def hoge
#     "hoge"
#   end
#   String do
#     def to_hoge
#       self
#     end
#   end
#   module_function :hoge
# end

class String
  def to_hoge
    self + " hoge"
  end
end

class Test04Refinements < Minitest::Test
  def test_01
    pp "hoge".to_hoge
  end
end
