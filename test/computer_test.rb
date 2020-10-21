require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'
require './lib/player'
require './lib/computer'

class ComputerTest < Minitest::Test

  def test_it_exists
    computer = Computer.new

    assert_instance_of Computer, computer
  end

  def test_it_has_ships
    computer = Computer.new

    assert_instance_of Ship, computer.cruiser
    assert_instance_of Ship, computer.submarine
    assert_equal 2, computer.ship_count
  end

  def test_it_can_place_cruiser
    computer = Computer.new

    computer.place_cruiser
  end
end
