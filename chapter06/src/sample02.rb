require "awesome_print"

def explore_array(method)
  code = "['a', 'b', 'c'].#{method}"
  puts "Evaluating: #{code}"
  eval code
end

loop {
  p explore_array(gets.chomp)
}