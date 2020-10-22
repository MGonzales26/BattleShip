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
require 'pry'; binding.pry
    game.computer_shot
  end
end