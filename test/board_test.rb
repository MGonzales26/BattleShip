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
    board = Board.new

    assert_equal true, board.valid_coordinate?("A1")
    assert_equal false, board.valid_coordinate?("A5")
    assert_equal true, board.valid_coordinate?("D4")
    assert_equal false, board.valid_coordinate?("E1")
    assert_equal false, board.valid_coordinate?("A22")
  end

  def test_it_has_valid_ship_length
    board = Board.new

    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal false, board.valid_ship_length?(cruiser, ["A1", "A2"])
    assert_equal false, board.valid_ship_length?(submarine, ["A2", "A3", "A4"])
  end

  def test_placement_is_valid
    board = Board.new

    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal false, board.valid_placement?(cruiser, ["A1", "A2"])
    assert_equal false, board.valid_placement?(submarine, ["A2", "A3", "A4"])
  end

  def test_it_can_isolate_numbers
    board = Board.new

    assert_equal [1, 2, 3], board.isolate_numbers(["A1", "A2", "A3"])
  end

  def test_numbers_consecutive
    board = Board.new

    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal true, board.numbers_consecutive?(["A1", "A2", "A3"])
    assert_equal false, board.numbers_consecutive?(["A1", "A3"])
    assert_equal true, board.numbers_consecutive?(["A1", "A2"])
  end

  def test_it_can_isolate_letters
    board = Board.new

    assert_equal [65, 66, 67], board.isolate_letters(["A1", "B2", "C3"])
  end

  def test_it_knows_ord_columns
      board = Board.new

      assert_equal [65, 66, 67, 68], board.ord_columns
  end

  def test_letters_consecutive
      board = Board.new

      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)

      assert_equal true, board.letters_consecutive?(["A1", "B2", "C3"])
      assert_equal false, board.letters_consecutive?(["A1", "A3"])
      assert_equal true, board.letters_consecutive?(["A1", "B2"])
  end

  def test_it_cannot_be_diagonal
      board = Board.new

      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)

      assert_equal false, board.valid_placement?(cruiser, ["A1", "B2", "C3"])
      assert_equal false, board.valid_placement?(submarine, ["C2", "D3"])
  end

  def test_placement_is_consecutive
      board = Board.new

      cruiser = Ship.new("Cruiser", 3)
      submarine = Ship.new("Submarine", 2)

      assert_equal false, board.valid_placement?(cruiser, ["A1", "A2", "A4"])
      assert_equal false, board.valid_placement?(submarine, ["A1", "C1"])
      assert_equal false, board.valid_placement?(cruiser, ["A3", "A2", "A1"])
      assert_equal true, board.valid_placement?(cruiser, ["A1", "A2", "A3"])
      assert_equal false, board.valid_placement?(submarine, ["C1", "B1"])
      assert_equal false, board.valid_placement?(cruiser, ["A5", "A6", "A7"])
  end
end
