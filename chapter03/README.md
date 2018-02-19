# 第3章 メソッド

## シンボル
シンボルは固定のオブジェクトIDを持ったオブジェクト

ハッシュにアクセスする場合は文字列でアクセスするより早い。rubyのバージョンが上がるにつれて最適化されてきているので以前より気にする必要はなくなっているかもしれない。
```ruby
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
```

結果は下記

```
$ ruby chapter03/src/symbol_bench.rb 
Ruby ver: 1.8.7
                user     system      total        real
symbol      1.660000   0.000000   1.660000 (  1.659999)
string      2.580000   0.000000   2.580000 (  2.598226)

$ ruby chapter03/src/symbol_bench.rb 
Ruby ver: 2.4.2
                 user     system      total        real
symbol       0.680000   0.000000   0.680000 (  0.686470)
string       0.910000   0.000000   0.910000 (  0.914801)
```

## 3.2 動的メソッド

`test_3-2.rb`を参照

sendを使うとprivateメソッドも呼び出せる。

事故が怖い時は`public_send`を使ってprivateメソッドには送らないようにすることもできる。

`Module#define_method`を使うことでMyClassの中に動的にインスタンスメソッドを定義することができる。

## 3.3 method_missing

BasicObjectのprivate_methodとしてmethod_missingが存在する
```
[8] pry(main)> BasicObject.private_methods.grep /method_missing/
=> [:method_missing]
```

method_missingを利用したhack方法を`ゴーストメソッド`と呼ぶ。

[Hasie](https://github.com/intridea/hashie)というgemに良い実装がある。

ゴーストメソッドを捕捉して他のオブジェクトに転送するような仕組みは`動的プロキシ`と呼ばれる。

詳細は[Ghee](https://github.com/huboard/ghee)というGitHub APIを取り扱うgemを参照。中でhasieを利用している。

`respond_to?`メソッドは、レシーバーとなるオブジェクトが引数に与えられたメソッドに対して応答可能であればtrueを返す。応答不可能な場合、`respond_to_missing?`関数を呼び出す。

respond_to_missing?は要はghost_method?だ。

ゴーストメソッドを使う時は常にsuperを呼び出す、respond_to_missing?を再定義する、というやり方に従うとある程度の危険は回避できる。

## 3.5 ブランクスレート

ゴーストメソッドの名前と継承したメソッドの名前が衝突すると、継承したメソッドの方を使ってしまうので、不必要なメソッドは削除しておく。

最小限のメソッドしかない状態のクラスを`ブランクスレート`と呼ぶ

[Builder](https://github.com/jimweirich/builder)にBlankSlateクラスがあり、そこに詳しい。