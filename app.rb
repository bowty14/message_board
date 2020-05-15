require('sinatra') 
require('sinatra/reloader') 
require('./lib/Board.rb')
require('./lib/Message.rb')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  @boards = Board.all
  erb(:homepage)
end

get('/homepage') do
  if (params[:search])
    @boards = Board.search(params[:search])
  else 
    @boards = Board.all
  end
  erb(:homepage)
end

post('/homepage') do 
  name = params[:board_name]
  board = Board.new({:name => name, :id => nil})
  board.save()
  @boards = Board.all()
  erb(:homepage)
end

get('/homepage/search') do
  @search_results = Board.search(params[:search])
  erb(:search_results)
end

get('/homepage/new') do
  erb(:new_board)
end

get('/homepage/:id') do
  @board = Board.find(params(:id).to_i())
  erb(:homepage)
end

# ------------------ ADMIN ---------------------

patch('/homepage/:id') do
  @board = Board.find(params[:id].to_i())
  @board.update(params[:name])
  @board = Board.all
  erb(:homepage)
end

delete('/homepage/:id') do
  @board = Board.find(params[:id].to_i())
  @board.delete()
  @board = Board.all()
  erb(:homepage)
end

# ------------------ MESSAGES ---------------------
get('/homepage/:id/messages/:message_id') do
  @message = Message.find(params[:message_id].to_i())
  erb(:message)
end