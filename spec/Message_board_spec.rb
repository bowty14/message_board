require ('Message_board')
require ('pry')
require ('rspec')

describe('#save') do
  it('Will save a new board that is created') do
   board1 = Board.new('dogs', nil)
   expect(board.all).to(eq(['board1,board2']))
  end
end