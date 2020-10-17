require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'

class BoardTest < Minitest::Test

  def test_it_exists
    board = Board.new

    assert_instance_of Board, board
  end

  def test_it_has_cells
    board = Board.new
    
    assert_equal "A1", board.cells.keys[0]
    assert_equal "D4", board.cells.keys[-1]
    assert_instance_of Cell, board.cells.values[0]
    assert_instance_of Cell, board.cells.values[-1]
  end

  def test_valid_coordinate
    skip
    board = Board.new

    assert_equal true, board.valid_coordinate?("A1")
    assert_equal false, board.valid_coordinate?("A5")
    assert_equal true, board.valid_coordinate?("D4")
    assert_equal false, board.valid_coordinate?("E1")
    assert_equal false, board.valid_coordinate?("A22")
  end

  def test_placement_is_valid
    skip
    board = Board.new

    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)  

    assert_equal false, board.valid_placement?(cruiser, ["A1", "A2"])
    assert_equal false, board.valid_placement?(submarine, ["A2", "A3", "A4"])
  end

  def test_placement_is_consecutive
    skip
    board = Board.new

    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal false, board.valid_placement?(cruiser, ["A1", "A2", "A4"])
    assert_equal false, board.valid_placement?(submarine, ["A1", "C1"])
    assert_equal false, board.valid_placement?(cruiser, ["A3", "A2", "A1"])
    assert_equal false, board.valid_placement?(submarine, ["C1", "B1"])
  end

  def test_create_board
    skip
    board = Board.new

    board.create_board
  end
end