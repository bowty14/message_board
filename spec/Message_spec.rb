require ('Message')
require ('pry')
require ('rspec')

describe('#Message') do
  
  before(:each) do
    Board.clear()
    Message.clear()
    @board = Board.new({:name => "music", :id => nil})
    @board.save()
  end

  describe('.clear') do
    it('clears all messages') do
      message = Message.new({:text => "music", :board_id => @board.id, :id => nil})
      message.save()
      message2 = Message.new({:text => "music", :board_id => @board.id, :id => nil})
      message2.save()
     
      Message.clear()
      expect(Message.all).to(eq([]))
    end
  end

  describe('#==') do
    it("is the same message if it has the same attributes as another message") do
      message = Message.new({:text => "music", :board_id => @board.id, :id => nil})
      message1 = Message.new({:text => "music", :board_id => @board.id, :id => nil})
      
      expect(message).to(eq(message1))
    end
  end
  
end