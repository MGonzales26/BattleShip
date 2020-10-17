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

  # require 'pry'; binding.pry

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

  def numbers_consecutive?(placement)
    # require "pry"; binding.pry
  something = @rows.each_cons(placement.count).to_a
  something.any? do |some|
    isolate_numbers(placement) == some
    end
  end
    # numbers = []
    # placement.each do |place|
    #   numbers << place.chars[1].ord
    # # end
    # # require 'pry'; binding.pry
    # numbers.each_cons(placement.count).any? do |number|
    # end
    # numbers
    def isolate_letters(placement)
      placement.map do |place|
        place[0].ord
      end
    end

  def letters_consecutive?(placement)
    range.to_a.map do |letter|
      letter.ord
    end.each_cons(3).to_a
  end

  # def valid_placement?(ship, placement)
    # valid_ship_length(ship, placement) && (numbers_consecutive?(placement) || letters_consecutive?)

  #   # ship.length == placement.count
  #
  #   # valid_coordinate
  #   # valid_coordinate?
  #   # valid_ship_length
  #   # numbers consecutive
  #   # letters consecutive
  # end

  # placement.each_cons(ship.length) do |place|
  #   require 'pry'; binding.pry
    # end
    # if ship.length == placement.count
end

# A = 1
# B = 2
# C = 3

# a = 95
# b = 96
# c = 97

# ? = 150

# 1 = 238
# 2 = 239
# 3 = 240

#    1 2 3 4 . . . 26
#  A . . . .
#  B . . . .
#  C . . . .
#  D . . . .
#  .
#  .
#  .
#  Z
# end
# end
