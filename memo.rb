# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader'
require 'json'

get '/' do
  File.open('data.json') do |file|
    hash = JSON.load(file)
    @hash = hash
  end
  erb :index
end

post '/' do
  File.open('data.json') do |file|
    hash = JSON.load(file)
    @hash = hash
  end
  key, value = @hash.to_a.last
  id = (key.to_i + 1).to_s
  hash=@hash.merge(id => {'title' => params[:title], 'content' => params[:content]})

  File.open('data.json', 'w') do |file|
    str = JSON.dump(hash, file)
  end
  redirect to '/'
end

delete '/*' do |id|
  File.open('data.json') do |file|
    hash = JSON.load(file)
    @hash = hash
  end
  hash = @hash
  hash.delete(id)

  File.open('data.json', 'w') do |file|
    str = JSON.dump(hash, file)
  end
  redirect to '/'
end

patch '/*' do |id|
  File.open('data.json') do |file|
    hash = JSON.load(file)
    @hash = hash
  end
  hash = @hash
  #hash.delete(id)
  hash[id]['title'] = params[:title]
  hash[id]['content'] = params[:content]

  File.open('data.json', 'w') do |file|
    str = JSON.dump(hash, file)
  end
  redirect to '/'
end

get '/showmemo/:id' do |id|
  @id = id
  File.open('data.json') do |file|
    memo = JSON.load(file)
    @memo = memo["#{params[:id]}"]
  end

  erb :showmemo
end

get '/newmemo' do
  erb :newmemo
end

get '/editmemo/:id' do |id|
  @id = id
  File.open('data.json') do |file|
    memo = JSON.load(file)
    @memo = memo[params[:id]]
  end

  erb :editmemo
end
