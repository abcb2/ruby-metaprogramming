# openclass

class String
  def method_missing(method, *args)
    "HERE #{method} #{args}"
  end
end


puts "A1: #{'foo'.no_method(1, 2, 3) == 'HERE no_method [1, 2, 3]'}"
