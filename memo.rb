# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader'
require 'json'
require 'cgi'

def get_all_memos
  File.open('data.json') do |file|
    @all_memos = JSON.parse(file.read)
  end
end

def get_memo(id)
  @id = id
  File.open('data.json') do |file|
    memo = JSON.parse(file.read)
    @memo = memo[params[:id]]
  end
end


def update_all_memos(hash)
  File.open('data.json', 'w') do |file|
    JSON.dump(hash, file)
  end
  redirect to '/'
end

if !File.exist?('data.json') || File.zero?('data.json')
  File.open('data.json', 'w') do |file|
    JSON.dump({}, file)
  end
end

get '/' do
  get_all_memos
  erb :index
end

post '/' do
  get_all_memos
  id = if @all_memos.empty?
         '1'
       else
         id = (@all_memos.keys.last.to_i + 1).to_s
       end
  hash = @all_memos.merge(id => params.slice(:title, :content) )

  update_all_memos(hash)
end

delete '/*' do |id|
  get_all_memos
  hash = @all_memos
  hash.delete(id)

  update_all_memos(hash)
end

patch '/*' do |id|
  get_all_memos
  hash = @all_memos
  hash[id]['title'] = params[:title]
  hash[id]['content'] = params[:content]

  update_all_memos(hash)
end

get '/showmemo/:id' do |id|
  get_memo(id)
  erb :showmemo
end

get '/newmemo' do
  erb :newmemo
end

get '/editmemo/:id' do |id|
  get_memo(id)
  erb :editmemo
end
