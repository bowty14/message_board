require ('Message_board')
require ('pry')
require ('rspec')

describe('#save') do
  it('Will save a new board that is created') do
   board1 = Board.new('dogs', nil)
   board1.save()
   board2 = Board.new('cats',nil)
   board2.save()
   expect(Board.all).to(eq([board1,board2]))
  end
end