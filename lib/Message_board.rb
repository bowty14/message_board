require ('pry')

class Board
  attr_reader :id, :name
  @@total_rows = 0
  @@boards = {}

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id) || @@total_rows += 1
  end

  def self.all
    @@boards.values()
  end

  def save
    @@boards[self.id] = Board.new({:name => self.name, :id => self.id})
  end

  def ==(board_to_compare)
    self.name() ==  board_to_compare.name()
  end

  def self.clear
    @@boards = {}
    @@total_rows = 0
  end

  # def update(name)
  #   # self.name = name
  #   # @@boards[self.id] = Board.new({:name => self.name, :id => self.id})
  # end

  def self.find(id)
    @@boards[id]
  end  

end