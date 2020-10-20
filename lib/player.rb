class Player
  attr_reader :board,
              :cruiser,
              :submarine,
              :ship_count

  def initialize
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @ship_count = 2
  end

  def setup
    p "I have laid out my ships on the grid."
    p "You now need to lay out your two ships."
    p "The Cruiser is three units long and the Submarine is two units long."
    puts @board.render(true)
  end
  
  def place_cruiser
    loop do
      p "Enter the squares for the Cruiser (3 spaces):"
      input =  gets.chomp.upcase
      if @board.valid_placement?(@cruiser, input.split)
        @board.place(@cruiser, input.split)
        break
      else
        p "Those are not valid Coordinates. Please try again:"
      end
    end
    puts @board.render(true)
  end

  def place_submarine
    p "Enter the squares for the Submarine (2 spaces):"
    loop do
      input =  gets.chomp.upcase
      if @board.valid_placement?(@submarine, input.split)
        @board.place(@submarine, input.split)
        break
      else
        p "Those are not valid coordinates. Please try again:"
      end
    end
    puts @board.render(true)
  end
end