class Message
  attr_reader :id
  attr_accessor :text, :board_id
  @@total_rows = 0
  @@messages = {}

  def initialize(attributes)
    @text = attributes.fetch(:text)
    @board_id = attributes.fetch(:board_id)
    @id = attributes.fetch(:id) || @@total_rows += 1
  end

  def self.all
    @@messages.values
  end
  
  def save
    @@messages[self.id] = Message.new({:text => self.text, :board_id => self.board_id, :id => self.id})
  end

  def == (message_to_compare)
    (self.text() == message_to_compare.text()) && (self.board_id() == message_to_compare.board_id())
  end


  def self.clear
    @@messages = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@messages[id]
  end

  # def update(text, stage_id)
  #   self.text = text
  #   self.boa_id = stage_id
  #   @@messages[self.id] = Artist.new(self.text, self.stage_id, id)
  # end

  # def delete
  #   @@messages.delete(self.id)
  # end
  

  def self.find_by_board(board_id)
    messages = []
    @@messages.values.each do |message|
      if message.board_id == board_id
        messages.push(message)
      end  
    end
    messages
  end

  def board
    Board.find(self.board_id)
  end

  
end