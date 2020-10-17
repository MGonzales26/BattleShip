class Board
  attr_reader :cells,
              :rows,
              :columns

  def initialize
    @cells   = make_cells
    @rows    = rows
    @columns = columns
  end

  def create_board
    size = 4
    alphabet = ("A".."Z").to_a
    @rows = (1..size).to_a
    @columns = ("A"..alphabet[size-1]).to_a
    coords = @columns.map do |letter|
      @rows.map do |number|
        letter + number.to_s
      end
    end
    coords.flatten
  end

  def make_cells
    cells = {}
    create_board.map do |coor|
      cells[coor] = Cell.new(coor)
    end
    cells
  end

  def valid_coordinate?(coord)
    @cells.any? do |name, cell|
      cell.coordinate == coord
    end
  end

  def valid_ship_length?(ship, placement)
    ship.length == placement.count
  end

  def isolate_numbers(placement)
    placement.map do |place|
      place[1].to_i
    end
  end
# change the word something to a better name
  def numbers_consecutive?(placement)
    something = @rows.each_cons(placement.count).to_a
    something.any? do |some|
      isolate_numbers(placement) == some
    end
  end

  def isolate_letters(placement)
    placement.map do |place|
      place[0].ord
    end
  end

  def ord_columns
    @columns.map do |letter|
      letter.ord
    end
  end

  def letters_consecutive?(placement)
    something_else = ord_columns.each_cons(placement.count).to_a
    something_else.any? do |some|
      isolate_letters(placement) == some
    end
  end

  def valid_placement?(ship, placement)
    valid_ship_length?(ship, placement) &&
    (numbers_consecutive?(placement) || letters_consecutive?(placement)) &&
    !(numbers_consecutive?(placement) && letters_consecutive?(placement))
  end
end

  # ship.length == placement.count
  #
  #   # valid_coordinate
  #   # valid_coordinate?
  #   # valid_ship_length
  #   # numbers consecutive
  #   # letters consecutive


  # placement.each_cons(ship.length) do |place|
  #   require 'pry'; binding.pry
    # end
    # if ship.length == placement.count
