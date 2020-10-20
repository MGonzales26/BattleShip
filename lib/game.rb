class Game
  attr_reader :player,
              :computer

  def initialize
    @player = Player.new
    @computer = Computer.new
  end

  def main_menu
    p "Welcome to BATTLESHIP "
    p "Enter p to play. Enter q to quit."
    input = gets.chomp.upcase
    if input == "P"
      setup
    elsif input == "Q"
      "Bye, loser!"
    else
      "Mind your p's and q's."
    end
  end

  def setup
    computer.place_cruiser
    computer.place_submarine
    player.setup
    player.place_cruiser
    player.place_submarine
    turn
  end

  def turn
    loop do 
      display_boards
      player_shot
      computer_shot
    #player results
    #computer results
    #winner?
    end
  end

  def display_boards
    puts "=============COMPUTER BOARD============="
    puts @computer.board.render
    puts "==============PLAYER BOARD=============="
    puts @player.board.render(true)
  end

  def player_shot
    p "Enter the coordinate for your shot:"
    loop do
      input = gets.chomp.upcase
      if @computer.board.valid_coordinate?(input) && !(@computer.board.cells[input].fired_upon?)
        @computer.board.cells[input].fire_upon
        break
      else
        p "Please enter a valid coordinate:"
      end
    end
  end

  def computer_shot
    loop do
      shot = @player.board.cells.keys.sample
      if @player.board.valid_coordinate?(shot) && !(@player.board.cells[shot].fired_upon?)
        @player.board.cells[shot].fire_upon
        break
      end
    end
  end
end