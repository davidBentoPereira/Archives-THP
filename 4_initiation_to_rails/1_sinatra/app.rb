require 'bundler'
Bundler.require

get '\hello' do
  '<h1>Hello world ! </h1>'
end
