#  p.12
class String
  def to_alphanumeric
    gsub(/[^\w\s]/, '')
  end
end

puts '#3, the *Magic, Number*?'.to_alphanumeric == "3 the Magic Number"


=begin
  p.13
  オープンクラス
=end
3.times do
  class C
    puts "Hello"
  end
end