require('sinatra') 
require('sinatra/reloader') 
require('./lib/Message_board.rb')
require('pry')
also_reload('lib/**/*.rb')