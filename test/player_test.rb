require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'
require './lib/player'
require './lib/computer'

class PlayerTest < Minitest::Test

  def test_it_exists
    player = Player.new

    assert_instance_of Player, player
  end

  def test_it_has_ships
    player = Player.new

    assert_instance_of Ship, player.cruiser
    assert_instance_of Ship, player.submarine
    assert_equal 2, player.ship_count
  end

  def test_place_cruiser
    skip
    player = Player.new

    expected = "  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n"

    assert_equal expected, player.place_cruiser
  end

  def test_place_submarine
    player = Player.new

    expected = "  1 2 3 4 \nA S S . . \nB . . . . \nC . . . . \nD . . . . \n"
player.player_shot
    assert_equal expected, player.place_submarine
  end


end