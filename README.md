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
## 実行方法
1. クローンする
  ```sh
  git clone -b my-memo https://github.com/y-kawahara-gs/sinatra_memo.git （名前） 
  ```
2. memo.rbの実行
  - bundleを使用して、memo.rbを実行
    ```sh
    bundle exec ruby memo.rb
    ```
3. 実行画面

- ターミナル
<img width="899" height="420" alt="image" src="https://github.com/user-attachments/assets/10c0bf72-02dc-43f0-937a-e8eba7806945" />
  
- ブラウザ
  - 実行中に http://127.0.0.1:4567 にブラウザでアクセス
<img width="678" height="354" alt="image" src="https://github.com/user-attachments/assets/f66102cf-b499-4ed6-be63-6b2aa1fb7bb3" />

## 使い方
- 実行した際、カレントディレクトリにJSONファイル「data.json」が作成される。
<img width="550" height="104" alt="image" src="https://github.com/user-attachments/assets/9896053e-61e7-400b-ae24-e481a72030eb" />

- 追加ボタンを押すと、内容を記述する画面に遷移する
<img width="389" height="361" alt="image" src="https://github.com/user-attachments/assets/6c2f8efd-3b60-400c-82d9-338e35997b0e" />

- 記入し、保存ボタンを押すと、タイトルがリストに追加される
<img width="365" height="282" alt="image" src="https://github.com/user-attachments/assets/abfcc229-f0bd-43f8-ab93-5ee7e65d1c40" />

- 同様にメモを作成することができる
<img width="328" height="356" alt="image" src="https://github.com/user-attachments/assets/33f32709-eebd-467b-9622-923f6ff93884" />

- リストのタイトルをクリックすると、そのタイトルのメモの中身を見ることができる
<img width="356" height="342" alt="image" src="https://github.com/user-attachments/assets/59121175-7bbe-4498-9c93-e8140e1e21cb" />

- 変更ボタンを押すと内容を更新することができる
<img width="339" height="357" alt="image" src="https://github.com/user-attachments/assets/92537073-fcd7-44d1-8063-e98661708cf9" />

<img width="396" height="390" alt="image" src="https://github.com/user-attachments/assets/3b807950-deef-4f96-a119-b68a0c2d399a" />

- 削除ボタンを押すと、そのメモがリストから消去される
<img width="403" height="382" alt="image" src="https://github.com/user-attachments/assets/a41b0585-ebf0-4d96-af38-38347205a7ea" />








