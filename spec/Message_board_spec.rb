require ('Message_board')
require ('pry')
require ('rspec')

describe('#Board') do

describe('.all') do
  it('returns an empty array when there are no boards') do
    expect(Board.all).to(eq([]))
  end
end

  describe('#save') do
    it('Will save a new board that is created') do
    board1 = Board.new({:name => "dogs", :id => nil})
    board1.save()
    board2 = Board.new({:name => "cats", :id => nil})
    board2.save()
    expect(Board.all).to(eq([board1,board2]))
    end
  end

  describe('.clear') do
    it("clears all boards") do
      board = Board.new({:name => "dogs", :id => nil})
      board.save()
      board2 = Board.new({:name => "cats", :id => nil})
      board2.save()
      Board.clear()
      expect(Board.all).to(eq([]))
    end
  end    


end