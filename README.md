# sinatraメモアプリ

## 使用にあたり必要なもの
- Ruby
  - ruby 3.4.5 (2025-07-16 revision 20cda200d3) +PRISM [x86_64-linux])を使用しています。
- gem
  - bundler
  - sinatra
  - sinatra-contrib
  - cgi 
  - rackup
  - puma

## 準備方法
### Rubyとライブラリの設定
- Rubyのインストール（Debianの例）
  ```sh
  $ sudo apt-get install ruby-full
  ```
- gem
  - bundlerのインストール
    sinatra\_memoフォルダにGemfileがあるのを確認し、以下のコマンドでインストール
    ```sh
    bundle install
    ```

### PostgreSQLとデータベースの設定

### PostgreSQLのインストール
こちらを参照
https://computingforgeeks.com/how-to-install-postgresql-16-on-debian/

### データベースの設定
- postgreSQLに接続
	```sh
	sudo -u postgres psql
	```
- ユーザを作成（作成後、\duで確認できる）
	ユーザ名にハイフンを使用する際はクォーテーションで囲む
	```SQL
	postgres=# CREATE ROLE "y-kawahara" WITH LOGIN PASSWORD 'password';
	```
- データベースの作成
	1. 新しいデータベースの作成（\lで確認できる）
		```SQL
		postgres=# CREATE DATABASE sinatra_memo（データベース名）;
		```
	2. 作成したデータベースにユーザのアクセス権を付与
		```SQL
		postgres=# GRANT ALL PRIVATES ON DATABASE sinatra_memo TO "y-kawahara";
		```
	3. rubyの以下のコマンドでアクセスできる
		```ruby
		require 'pg'
		PG.connect(dbname: 'sinatra_memo')
		```
- データベースの確認方法
	-  データベースに入れる
		```sh
		sudo -u postgres psql -d sinatra_memo
		```
### メモアプリ実行中に確認したい時
- 中身を見たいときはSELECT文（postgreSQL接続後）
	```SQL
	SELECT * FORM テーブル名
	```

## 実行方法
1. クローンする
  ```sh
  git clone -b my-memo-db https://github.com/y-kawahara-gs/sinatra_memo.git （名前） 
  ```
2. 実行前のpostgreSQL
	- テーブルは無い状態を確認
	  <img width="556" height="232" alt="image" src="https://github.com/user-attachments/assets/a5c44a73-ca12-4020-9063-6603fe7e92a1" />

3. memo.rbの実行
  - bundleを使用して、memo.rbを実行
    ```sh
    bundle exec ruby memo.rb
    ```
3. 実行画面

- ターミナル
  <img width="581" height="240" alt="image" src="https://github.com/user-attachments/assets/f7483859-d425-4887-b0a3-4a22950ae6e1" />

  
- ブラウザ
  - 実行中に http://127.0.0.1:4567 にブラウザでアクセス
	<img width="556" height="430" alt="image" src="https://github.com/user-attachments/assets/e6ed5a67-2c01-4f05-aae6-1cf4ec594927" />

- 起動時にテーブルも自動で作成される
	<img width="552" height="362" alt="image" src="https://github.com/user-attachments/assets/957172e9-4ecc-46fe-a82e-a118a061eddf" />

## 使い方


- 追加ボタンを押すと、内容を記述する画面に遷移する
	<img width="476" height="359" alt="image" src="https://github.com/user-attachments/assets/305200bd-7a85-4eaf-afdf-849676acb5a2" />


- 記入し、保存ボタンを押すと、タイトルがリストに追加される
	<img width="457" height="368" alt="image" src="https://github.com/user-attachments/assets/ad293ca5-dabd-4ba7-9f37-9fb935a93d23" />


- このときPostgreSQLもデータが作成されている
	<img width="532" height="162" alt="image" src="https://github.com/user-attachments/assets/c3a33693-bd07-4a54-8a09-d9f2497c3dc4" />


- 同様にメモを作成することができる
	<img width="435" height="368" alt="image" src="https://github.com/user-attachments/assets/92c88779-f1b0-4821-8a0f-ac6e2916648c" />


- リストのタイトルをクリックすると、そのタイトルのメモの中身を見ることができる
	<img width="394" height="343" alt="image" src="https://github.com/user-attachments/assets/4a2db30b-e3b5-4185-8573-4a3defd429be" />


- 変更ボタンを押すと内容を更新することができ、序列は下に移動する
	<img width="422" height="342" alt="image" src="https://github.com/user-attachments/assets/c2e23da3-e2b6-4d3f-9302-edbff86e3cf0" />


	<img width="305" height="297" alt="image" src="https://github.com/user-attachments/assets/3965086f-7385-419b-9dac-9a121f85dfd2" />


- 削除ボタンを押すと、そのメモがリストから消去される
	<img width="403" height="338" alt="image" src="https://github.com/user-attachments/assets/24af6262-2365-42f1-9b7f-d1d3b87a799e" />

	<img width="424" height="391" alt="image" src="https://github.com/user-attachments/assets/4527ddba-6487-4a76-8e08-c3c67d54cc94" />

- またそれぞれの処理でデータベースも同様に動くことが確認できる
	<img width="521" height="189" alt="image" src="https://github.com/user-attachments/assets/290f9746-984d-4462-ae37-a609a3442b05" />

