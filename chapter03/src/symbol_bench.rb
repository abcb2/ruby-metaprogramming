require "benchmark"

hash_string = {
  "foo" => "FOO",
  "bar" => "BAR",
}
hash_symbol = {
  :foo => "FOO",
  :bar => "BAR",
}

puts "Ruby ver: " + RUBY_VERSION

Benchmark.bm 10 do |r|
  r.report "symbol" do
    10000000.times do
      foo = hash_symbol[:foo]
    end
  end
  r.report "string" do
    10000000.times do
      foo = hash_string["foo"]
    end
  end
end