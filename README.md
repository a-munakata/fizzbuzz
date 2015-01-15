# Fizzbuzz

これは、チーム開発でTDDを進めるためのテストです。
rubyでfizzbuzz問題を解こう！

## SETUP
### Gemパッケージのインストール

`$ bundle install`を実行して、Gemパッケージをインストールします。

### 実行環境
下記の環境を想定しています。

- RSpec 3.0.0
- Ruby 2.2.0

## TEST
テストは、Rspec + Guardで行います。

`$ bundle exec guard`コマンドを実行して、テストを自動観察します。

Guardの設定ファイルは[./Guardfile](Guardfile)を確認してください。