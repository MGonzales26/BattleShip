class Player
  attr_reader :cruiser,
              :submarine,
              :ship_count

  def initialize
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @ship_count = 2
  end

  def place_cruiser
    p "Enter the squares for the Cruiser (3 spaces):"
    input =  gets.chomp.upcase
    if @board.valid_placement?(@cruiser, input.split)
      @board.place(@cruiser, input.split)
    else
      p "Those are not valid Coordinates"
    end
    @board.render(true)
  end

  def place_submarine
    p "Enter the squares for the Submarine (2 spaces):"
    input =  gets.chomp.upcase
    if @board.valid_placement?(@submarine, input.split)
      @board.place(@submarine, input.split)
    else
      p "Those are not valid Coordinates"
    end
    @board.render(true)
  end
end