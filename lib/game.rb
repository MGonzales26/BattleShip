class Game

  def initialize
    @board = Board.new
  end

  def main_menu
    p "Welcome to BATTLESHIP "
    p "Enter p to play. Enter q to quit."
    input = gets.chomp.upcase
    if input == "P"
      start_game
    elsif input == "Q"
      "Bye, loser!"
    else
      "Mind your p's and q's."
    end
  end

  def start_game
    #have a human player
    player.place_cruiser
    player.place_submarine
    #have a computer player
    computer.set_ship
    #computer sets ships
    #human sets ships
    #start turns
  end
end