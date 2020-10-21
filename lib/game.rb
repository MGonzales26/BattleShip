class Game
  attr_reader :player,
              :computer

  def initialize
    @player   = Player.new
    @computer = Computer.new
  end

  def welcome
    puts "Welcome to BATTLESHIP"
    main_menu
  end

  def main_menu
    puts "Enter p to play. Enter q to quit."
    input = gets.chomp.upcase
    if input == "P"
      setup
    elsif input == "Q"
      puts "Bye, loser!"
    else
      puts "Mind your p's and q's."
      main_menu
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
      sleep(2.5)
      if end_game
        start_new_game
        break
      end
    end
  end

  def display_boards
    puts "=============COMPUTER BOARD============="
    puts @computer.board.render
    puts "==============PLAYER BOARD=============="
    puts @player.board.render(true)
  end

  def player_shot
    puts "Enter the coordinate for your shot:"
    loop do
      input = gets.chomp.upcase.strip
      if @computer.board.valid_coordinate?(input) && !(@computer.board.cells[input].fired_upon?)
        @computer.board.cells[input].fire_upon
        player_result(input)
        break
      else
        puts "Please enter a valid coordinate:"
      end
    end
  end

  def computer_shot
    loop do
      shot = @player.board.cells.keys.sample
      if @player.board.valid_coordinate?(shot) && !(@player.board.cells[shot].fired_upon?)
        @player.board.cells[shot].fire_upon
        computer_result(shot)
        break
      end
    end
  end

  def player_result(input)
    if @computer.board.cells[input].render ==  "M"
      puts "Your shot on #{input} was a miss."
    elsif @computer.board.cells[input].render ==  "H"
      puts "Your shot on #{input} was a hit."
    elsif  @computer.board.cells[input].render ==  "X"
      @computer.ship_count -= 1
      puts "Your shot on #{input} sunk the ship."
    end
  end

  def computer_result(shot)
    if @player.board.cells[shot].render ==  "M"
      puts "My shot on #{shot} was a miss."
    elsif @player.board.cells[shot].render ==  "H"
      puts "My shot on #{shot} was a hit."
    elsif  @player.board.cells[shot].render ==  "X"
      @player.ship_count -= 1
      puts "My shot on #{shot} sunk your ship."
    end
  end

  def start_new_game
    next_game = Game.new
    next_game.main_menu
  end

  def end_game
    if @player.ship_count == 0 && @computer.ship_count == 0
      puts "It's a tie."
      true
    elsif @player.ship_count == 0
      puts "What makes you think you could ever defeat me?! I was created by Yesi and Megan!"
      true
    elsif @computer.ship_count == 0
      puts "You won."
      true
    end
  end
end
