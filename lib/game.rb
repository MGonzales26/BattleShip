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
  end

  def turn
    display_boards
    #player shot
    #computer shot
    #player results
    #computer results
  end

  def display_boards
    puts "=============COMPUTER BOARD============="
    puts @computer.board.render
    puts "==============PLAYER BOARD=============="
    puts @player.board.render
  end
end