# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader'
require 'json'
require 'cgi'

get '/' do
  if File.exist?('data.json')
    if File.read('data.json') == ''
      File.open('data.json', 'w') do |file|
        JSON.dump({}, file)
      end
    end
  else
    File.open('data.json', 'w') do |file|
      JSON.dump({}, file)
    end
  end

  File.open('data.json', 'r') do |file|
    @hash = JSON.parse(file.read)
  end
  erb :index
end

post '/' do
  File.open('data.json') do |file|
    @hash = JSON.parse(file.read)
  end
  if @hash == {}
    hash = { '1' => { 'title' => params[:title], 'content' => params[:content] } }
  else
    key = @hash.to_a.last[0]
    id = (key.to_i + 1).to_s
    hash = @hash.merge(id => { 'title' => params[:title], 'content' => params[:content] })
  end

  File.open('data.json', 'w') do |file|
    JSON.dump(hash, file)
  end
  redirect to '/'
end

delete '/*' do |id|
  File.open('data.json') do |file|
    @hash = JSON.parse(file.read)
  end
  hash = @hash
  hash.delete(id)

  File.open('data.json', 'w') do |file|
    JSON.dump(hash, file)
  end
  redirect to '/'
end

patch '/*' do |id|
  File.open('data.json') do |file|
    @hash = JSON.parse(file.read)
  end
  hash = @hash
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
