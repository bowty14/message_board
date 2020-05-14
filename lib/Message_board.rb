require ('pry')

class Board
  attr_reader :id, :name
  @@total_rows = 0
  @@boards = {}

  def initialize()
    @name = name
    @id = id || @@total_rows += 1
    
  end

  def self.all
    @@boards.values()
  end

  def save
    @@boards[self.id] = Board.new(self.name, self.id)
  end

  def ==(board_to_compare)
    self.name() ==  board_to_compare.name()
  end  
end