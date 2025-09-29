# sinatraメモアプリ

## 使用にあたり必要なもの
- Ruby
  - ruby 3.4.5 (2025-07-16 revision 20cda200d3) +PRISM [x86_64-linux])を使用しています。
- gem
  - bundler
  - sinatra
  - sinatra-contrib

## 準備方法
- Rubyのインストール（Debianの例）
  ```sh
  $ sudo apt-get install ruby-full
  ```
- gem
  - bundlerのインストール
    ```sh
    $ gem install bundler
    ```
  - sinatra・sinatra-contribのインストール
    1. Gemfileを以下のコマンドで作成します。
      ```sh
      $ bundle init
      ```
    2. Gemfileに以下を記述
     ```gem
     gem "sinatra"
     gem "sinatra-contrib"
     ```  
    3.  Gemfileを保存して、以下のコマンドでインストール
    ```sh
    bundle install --path vendor/bundle
    ```
## 使用方法
```sh
git clone 
```

