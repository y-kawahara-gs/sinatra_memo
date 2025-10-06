# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader'
require 'json'
require 'cgi'
if !File.exist?('data.json') || File.zero?('data.json')
  File.open('data.json', 'w') do |file|
    JSON.dump({}, file)
  end
end

get '/' do
  File.open('data.json', 'r') do |file|
    @all_memos = JSON.parse(file.read)
  end
  erb :index
end

post '/' do
  File.open('data.json') do |file|
    @all_memos = JSON.parse(file.read)
  end
  if @all_memos.empty?
    hash = { '1' => { 'title' => params[:title], 'content' => params[:content] } }
  else
    key = @all_memos.to_a.last[0]
    id = (key.to_i + 1).to_s
    hash = @all_memos.merge(id => { 'title' => params[:title], 'content' => params[:content] })
  end

  File.open('data.json', 'w') do |file|
    JSON.dump(hash, file)
  end
  redirect to '/'
end

delete '/*' do |id|
  File.open('data.json') do |file|
    @all_memos = JSON.parse(file.read)
  end
  hash = @all_memos
  hash.delete(id)

  File.open('data.json', 'w') do |file|
    JSON.dump(hash, file)
  end
  redirect to '/'
end

patch '/*' do |id|
  File.open('data.json') do |file|
    @all_memos = JSON.parse(file.read)
  end
  hash = @all_memos
  hash[id]['title'] = params[:title]
  hash[id]['content'] = params[:content]

  File.open('data.json', 'w') do |file|
    JSON.dump(hash, file)
  end
  redirect to '/'
end

get '/showmemo/:id' do |id|
  @id = id
  File.open('data.json') do |file|
    memo = JSON.parse(file.read)
    @memo = memo[params[:id]]
  end

  erb :showmemo
end

get '/newmemo' do
  erb :newmemo
end

get '/editmemo/:id' do |id|
  @id = id
  File.open('data.json') do |file|
    memo = JSON.parse(file.read)
    @memo = memo[params[:id]]
  end

  erb :editmemo
end
