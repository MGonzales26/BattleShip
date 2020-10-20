class Computer
  attr_reader :board,
              :cruiser,
              :submarine

  attr_accessor :ship_count

  def initialize
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @ship_count = 2
  end

  def place_cruiser
    loop do
      placement = []
      until placement.count == cruiser.length do
        placement << @board.cells.keys.sample
      end
      if @board.valid_placement?(@cruiser, placement)
        @board.place(@cruiser, placement)
        break
      end
    end
    @board.render
  end

  def place_submarine
    loop do
      placement = []
      until placement.count == submarine.length do
        placement << @board.cells.keys.sample
      end
      if @board.valid_placement?(@submarine, placement)
        @board.place(@submarine, placement)
        break
      end
    end
    @board.render
  end
end
