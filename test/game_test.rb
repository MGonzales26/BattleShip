require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'
require './lib/player'
require './lib/computer'


class GameTest < Minitest::Test

  def test_it_exists
    game = Game.new

    assert_instance_of Game, game
  end

  def test_main_menu
    skip
    game = Game.new

    expected = "Welcome to BATTLESHIP \n" +
    "Enter p to play. Enter q to quit."

    assert_equal expected, game.main_menu
  end

  def test_player_shot
    game = Game.new

    game.computer_shot
  end

  def test_it_can_display_player_shots
    skip
    game = Game.new

    expected = "Your shot on A4 was a miss."

    game.player_shot

    assert_equal expected, game.player_result("A4")
  end

  def test_it_can_display_computer_shots
    skip
    game = Game.new

    expected = "My shot on C1 was a miss."

    assert_equal expected, game.computer_result
  end
  # def method_name
  #
  # end
  def test_it_knows_end_game
    game = Game.new

    game.end_game
  end

end
