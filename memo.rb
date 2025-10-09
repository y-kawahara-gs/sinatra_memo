# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require 'cgi'

def conn
  @conn ||= PG.connect(dbname: 'sinatra_memo')
end

configure do
  result = conn.exec("SELECT * FROM information_schema.tables WHERE table_name = 'memos'")
  conn.exec('CREATE TABLE memos (id serial primary key, title varchar(255), content text)') if result.values.empty?
end

def load_memos
  conn.exec('SELECT * FROM memos ORDER BY id ')
end

def post_memo(title, content)
  conn.exec_params('INSERT INTO memos(title, content) VALUES ($1, $2);', [title, content])
end

def delete_memo(id)
  conn.exec_params('DELETE FROM memos WHERE id = $1;', [id])
end

def update_memo(title, content, id)
  conn.exec_params('UPDATE memos SET title = $1, content = $2 WHERE id = $3', [title, content, id])
end

def get_memo(id)
  result = conn.exec_params('SELECT * FROM memos WHERE id = $1;', [id])
  result.tuple_values(0)
end

get '/' do
  @memos = load_memos
  erb :index
end

post '/' do
  title = params[:title]
  content = params[:content]
  post_memo(title, content)
  redirect '/'
end

delete '/showmemo/*' do |id|
  delete_memo(id)
  redirect '/'
end

patch '/showmemo/*' do |id|
  title = params[:title]
  content = params[:content]
  update_memo(title, content, id)
  redirect '/'
end

get '/showmemo/:id' do |id|
  @memo = get_memo(id)
  erb :showmemo
end

get '/newmemo' do
  erb :newmemo
end

get '/editmemo/:id' do |id|
  @memo = get_memo(id)
  erb :editmemo
end
