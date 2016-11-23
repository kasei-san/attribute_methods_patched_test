# README

rails5にて、model の `#[]` で enum を参照すると、今までは数値だったのが文字列で返ってくる修正を元に戻すパッチの動作確認
パッチの内容は
https://github.com/kasei-san/attribute_methods_patched_test/commit/e1e28981ea10e5ba71a958820c2e896186793c81
を参照

# 使い方

```
$ git clone https://github.com/kasei-san/attribute_methods_patched_test
$ cd attribute_methods_patched_test
$ bundle install --path vendor/bundle
$ rake db:migrate
$ rake db:seed
$ rails c
```

```.ruby
Test.first[:status] # => 1
```

## パッチを当てない場合の動作を確認


```
$ rm lib/patch.rb
```

```.ruby
Test.first[:status] # => :active
```
